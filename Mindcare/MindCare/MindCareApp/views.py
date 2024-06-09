from django.shortcuts import render,redirect
from django.http import HttpResponse,JsonResponse
from django.db.models import Q,Max

import json
import requests
from django.utils import timezone
import uuid
import random
from django.db.models import Prefetch
from django.views.decorators.csrf import csrf_exempt
from django.core.serializers import serialize
from django.core.mail import send_mail

from MindCareApp.models import *
from MindCareApp.forms import *
from MindCareApp.utils import *

from datetime import timedelta
from django.db import connection
from datetime import datetime, timedelta

# Create your views here.
def index(request):
    return render(request,'index.html')

def login(request):
    return render(request,'auth/login.html')    

def logout(request):
    request.session.clear()
    return render(request,'auth/login.html')

def register(request):
    return render(request,'auth/register.html')

def forgotPassword_view(request):
    return render(request,'auth/forgot_password.html')

def createAccount(request):
    if request.method == 'POST':
        form = UserForm(request.POST, request.FILES)
        
        if form.is_valid():
            user = form.save()
            response = {
                'status': True,
                'message': 'User Created Successfully'
            }
            return JsonResponse(response)
        else:
            # Form is not valid, extract error messages
            errors = form.errors
            error_message = str(errors['contact'][0]) if 'contact' in errors else str(errors['email'][0]) if 'email' in errors else 'Invalid form data'

            response = {
                'status': False,
                'message': error_message
            }
            return JsonResponse(response)

def loginAccount(request):
    if request.method=='POST': 
        email = request.POST['email']
        password = request.POST['password']
        user = User.objects.filter(email=email, password=password).first()

        if user is None  or (user.is_enabled ==0) :
            response={
                'status':False,
                'message':'Invalid User'
            }
        else:
            request.session['userId']=user.id
            request.session['userName']=user.name
            request.session['userPhone']=user.contact
            request.session['userEmail']=user.email
            request.session['userAddress']=user.address
            request.session['userImage']=str(user.image)
            response={
                'status':True,
                'is_admin':True if user.user_type == 'admin' else False,
                'message':'Successfully logged in'
            }
           
    return JsonResponse(response)

def appHome(request):
    user_id = request.session['userId']
    user_instance = User.objects.filter(id=user_id).first()
    return render(request,'home/user/user_home.html',{'user':user_instance})

def chatbot_view(request):
    request.session['session_id'] = generate_unique_id()
    return render(request,'home/user/chatbot.html')        

def chatRequest(request):
    if request.method == 'POST':
        inputText = request.POST['chat_input']
        id = request.session['userId']

        # create_message(request,'user',inputText)

        response = chat_with_rasa(inputText,id)
      
        emotion = ""
        message = ""

        for item in response:
            if 'text' in item:
                message = item['text']
            if 'custom' in item and 'emotion' in item['custom']:
                emotion = item['custom']['emotion']
                create_message(request,'',inputText,emotion)


    return JsonResponse(response, safe=False)

def create_message(request,sender,message,emotion=""):
    user_id = request.session['userId']
    session = request.session['session_id']

    user_instance = User.objects.get(pk=user_id)

    message=Messages.objects.create(
        sender = sender,
        content = message,
        emotion = emotion,
        user = user_instance,
        session_id=session,
    )
        
def chat_with_rasa(user_message,sender):
    rasa_url = 'http://localhost:5005/webhooks/rest/webhook'
    response = requests.post(rasa_url, json={ "sender" : sender ,"message" : user_message })
    rasa_data = response.json()
    return rasa_data

def music(request):
    if request.method == 'GET':
        music_type = request.GET.get('type', '')
        music_playlist =get_random_music(music_type)
    return render(request,'Home/user/music.html',{'music':music_playlist})  

def startActivity(request):
    if request.method == 'GET':
        type = request.GET.get('type', '')
        if type == 'music':
            return render(request,'Home/activity/music.html')  
        elif type == 'meditation':
            return render(request,'Home/activity/mindFree.html',{'media':'Meditation.mp4'})  
        elif type == 'breathing':
            return render(request,'Home/activity/mindFree.html',{'media':'pexels-alena-darmel-7192622 (2160p).mp4'})  
        elif type == 'walking':
            return render(request,'Home/activity/mindFree.html',{'media':'pexels-pat-whelen-5738706 (1080p).mp4'})  
        elif type == 'comedy':
            return render(request,'Home/activity/comedy.html')  

            
    return render(request,'Home/user/music.html')  

def activity(request):
    activities =Activity.objects.filter(is_enabled=1).values()
    return render(request,'Home/user/activities.html',{'activities':activities})

def search_activity(request):
    if request.method == 'GET':
        query = request.GET.get('type', '')
        activities =Activity.objects.filter(emotion__icontains=query).values()
    return JsonResponse(list(activities),safe=False)

def professionals(request):
    return render(request,'Home/user/professionals.html')
def progress(request):
    return render(request,'Home/user/progress.html')

def search_professionals(request):
    if request.method == 'GET':
        query = request.GET.get('type', '')
        activities = Professionals.objects.filter(location__icontains=query).values()
    return JsonResponse(list(activities),safe=False)

def get_progress(request):
    if request.method == 'GET':
        result = []

        # Get the current date
        current_date = datetime.now().date()

        # Calculate the start date for the past 6 days (inclusive)
        start_date = current_date - timedelta(days=6)
        # Filter messages for the date range
        messages_in_range = Messages.objects.filter(created_at__date__range=[start_date, current_date])

        # Iterate through each date in the range in reverse order
        for date in (start_date + timedelta(n) for n in range(6, -1, -1)):
            # Filter messages for the current date
            messages_on_date = messages_in_range.filter(created_at__date=date)

            if messages_on_date.exists():
                # Get the latest emotion for this date
                latest_emotion = messages_on_date.latest('created_at')
                result.append([date, latest_emotion.emotion])
            else:
                result.append([date, None])

        print(result)
    return JsonResponse(result,safe=False)            



def forgot_password(request):
    if request.method == 'POST':

        email= request.POST['email']
        user = User.objects.filter(email=email).first()
        if user and user is not None:
             subject = 'Password backup'
             message = f'Password of your mindcare application is : {user.password}'
             from_email = 'mindcare@gmail.com'
             recipient_list = [user.email]
             send_mail(subject, message, from_email, recipient_list, fail_silently=False)
             response = {
                'status': True,
                'message': 'Your  password has been Successfully sent to your email address'
             }
        else:
            response = {
                'status': False,
                'message': 'Invalid email id'
            }     
    return JsonResponse(response)
          




