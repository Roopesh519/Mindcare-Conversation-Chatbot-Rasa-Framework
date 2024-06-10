#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# Start Rasa server
rasa run --enable-api --cors "*" &

# Start Rasa action server
rasa run actions &

# Start Django server
python manage.py runserver 0.0.0.0:8000
