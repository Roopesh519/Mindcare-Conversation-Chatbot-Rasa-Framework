from django.db import models

# Create your models here.
class User(models.Model):

    class Meta:

        db_table = 'account'

    user_type = models.CharField(blank=False, max_length=50)
    name = models.CharField(blank=False, max_length=50)
    contact = models.CharField(
        blank=False, max_length=50,unique=True,
        error_messages={'unique': 'This contact number is already exist.'}
    )
    email = models.EmailField(
        blank=False, max_length=100, unique=True,
        error_messages={'unique': 'This email address is already exist.'}
    )    
    password = models.CharField(max_length=10, blank=False, default=None)
    image = models.ImageField(upload_to='user/', default=None)
    address = models.TextField(default=None)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_enabled = models.IntegerField(default = 1) 

class Activity(models.Model):
    class Meta:
        db_table = 'activity'

    emotion = models.CharField(blank=False, max_length=50)
    activity_name = models.CharField(blank=False, max_length=50)    
    type = models.CharField(blank=False, max_length=50)    
    image = models.ImageField(upload_to='activity/', default=None)
    is_enabled = models.IntegerField(default = 1) 
    timestamp = models.DateTimeField(auto_now_add=True)

class Professionals(models.Model):
    class Meta:
        db_table = 'professionals'

    name = models.CharField(blank=False, max_length=50)
    contact = models.CharField(
        blank=False, max_length=50,unique=True,
        error_messages={'unique': 'This contact number is already exist.'}
    )
    email = models.EmailField(
        blank=False, max_length=100, unique=True,
        error_messages={'unique': 'This email address is already exist.'}
    )
    image = models.ImageField(upload_to='professionals/', default=None)
    location = models.TextField(default=None)
    specialty = models.CharField(max_length=100, default="")
    timestamp = models.DateTimeField(auto_now_add=True)
    is_enabled = models.IntegerField(default = 1) 


class Messages(models.Model):
    class Meta:
        db_table = 'messages'
    session_id = models.CharField(max_length=20)  
    user = models.ForeignKey(User, on_delete=models.CASCADE)    
    sender = models.CharField(max_length=20)  
    emotion = models.CharField(max_length=100,default="")  
    content = models.TextField(db_collation='utf8mb4_general_ci')
    created_at = models.DateTimeField(auto_now_add=True)    