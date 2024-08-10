#!/bin/bash

# Install Python (this assumes Vercel has Ubuntu or Debian-like environment)
# apt-get update
# apt-get install -y python3 python3-pip python3-venv

# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

pip install --upgrade pip

# Install Python dependencies
pip install -r Mindcare/requirement.txt

# Navigate to the directory where Rasa and Django are located
cd Mindcare/MindCareModal

# Run the Rasa server
rasa run --enable-api --cors "*" &

# Run the Rasa action server
rasa run actions &

# Navigate to Django directory
cd ../MindCare

# Run the Django development server
python manage.py runserver 0.0.0.0:$PORT
