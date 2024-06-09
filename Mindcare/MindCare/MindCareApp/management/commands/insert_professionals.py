from django.core.management.base import BaseCommand
from django.core.files import File
from MindCareApp.models import Professionals
from django.core.files.images import ImageFile
import os

class Command(BaseCommand):
    help = 'Inserts initial data for the Professionals model'

    def handle(self, *args, **options):

        professionals_data = [
            {
                'name': 'John Doe',
                'contact': '1234567890',
                'email': 'john@example.com',
                'location': 'Mangalore',
                'image': 'professionals/alex-suprun-ZHvM3XIOHoE-unsplash.jpg', 
                'specialty':'Counselling Psychologists'
            },
            {
                'name': 'Jane Doe',
                'contact': '9876543210',
                'email': 'jane@example.com',
                'location': 'Mangalore',
                'image': 'professionals/pexels-marc-lloyd-1462980.jpg',  
                'specialty':'Educational Psychologists'

            },
            {
                'name': 'Harsha',
                'contact': '9876543216',
                'email': 'harsha@example.com',
                'location': 'Lalbhag',
                'image': 'professionals/michael-dam-mEZ3PoFGs_k-unsplash.jpg',  
                'specialty':'Counselling Psychologists'

            },
            {
                'name': 'Shristi',
                'contact': '9877543216',
                'email': 'sristi@example.com',
                'location': 'Jyothi',
                'image': 'professionals/christopher-campbell-rDEOVtE7vOs-unsplash.jpg', 
                'specialty':'Cognitive and Perceptual Psychologists.'

            },
            {
                'name': 'Kiran',
                'contact': '3456789012',
                'email': 'kiran@example.com',
                'location': 'Ballalbhag',
                'image': 'professionals/christian-buehner-DItYlc26zVI-unsplash.jpg',  # Replace with the actual image filename
                'specialty':'Educational Psychologists'

            },
            {
                'name': 'Karan',
                'contact': '3496789012',
                'email': 'karan@example.com',
                'location': 'Ballalbhag',
                'image': 'professionals/alexander-hipp-iEEBWgY_6lA-unsplash.jpg',  # Replace with the actual image filename
                'specialty':' Cognitive and Perceptual Psychologists.'

            },
            # Add more data as needed
        ]

        for data in professionals_data:
            professional = Professionals.objects.create(**data)
            self.stdout.write(self.style.SUCCESS(f'Successfully created Professional "{professional.name}"'))

 