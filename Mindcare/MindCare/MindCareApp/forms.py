from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from .models import User
import datetime

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['user_type', 'name', 'contact', 'email', 'password', 'image', 'address']

    def __init__(self, *args, **kwargs):
        super(UserForm, self).__init__(*args, **kwargs)
        

    def save(self, commit=True):
        user = super(UserForm, self).save(commit=False)
        
        # Modify the image name before saving
        username = self.cleaned_data['name']
        current_datetime = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
        # Get the original file extension from the uploaded image
        original_image_name = user.image.name
        file_extension = original_image_name.split('.')[-1].lower()
        
        # Construct the new image name with the original file extension
        image_name = f"{username}_{current_datetime}.{file_extension}"
        user.image.name = image_name

        if commit:
            user.save()

        return user

    def clean(self):
        cleaned_data = super().clean()
        contact = cleaned_data.get('contact')
        email = cleaned_data.get('email')


        # Check for uniqueness of contact
        if User.objects.filter(contact=contact).exclude(pk=self.instance.pk).exists():
            self.add_error('contact', 'This contact number is already exist.')

        # Check for uniqueness of email
        if User.objects.filter(email=email).exclude(pk=self.instance.pk).exists():
            self.add_error('email', 'This email address is already exist.')

        return cleaned_data
