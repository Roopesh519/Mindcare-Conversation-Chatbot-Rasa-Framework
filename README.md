# MindCare: A Mental Health Intervention System Using Linguistic Intelligence

## Overview

This repository contains the implementation of a Mood Classification and Recommendation System using a dataset and chatbot. The system provides mental health support and guidance through pre-programmed responses, emotional information extraction, activity recommendations, and music recommendations.

## Tech Stack

![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![Python](https://img.shields.io/badge/python-%233776AB.svg?style=for-the-badge&logo=python&logoColor=white) ![Django](https://img.shields.io/badge/django-%23092E20.svg?style=for-the-badge&logo=django&logoColor=white) ![Rasa](https://img.shields.io/badge/rasa-%235A9DD8.svg?style=for-the-badge&logo=rasa&logoColor=white) ![MySQL](https://img.shields.io/badge/mysql-%234479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)

## Table of Contents

- [System Architecture](#system-architecture)
- [User Journey](#user-journey)
- [Implementation](#implementation)
  - [Data Pre-processing](#data-pre-processing)
  - [Rasa Framework](#rasa-framework)
    - [Natural Language Understanding (NLU)](#natural-language-understanding-nlu)
- [Features](#features)
- [Demo Video](#demo-video)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## System Architecture

The system architecture consists of the following components:

1. **Chatbot Interface**: The primary user interaction point providing support and guidance with pre-programmed responses. It collects emotional data from user inputs.
2. **Data Pre-processing**: Involves cleaning and transforming text or speech data, which is converted to text via speech recognition tools.
3. **Dataset Handling**: The dataset, containing labeled text or speech data, is split into training and testing sets.
4. **Emotion Detection**: Intents, entities, and responses are created for different emotions (Neutral, Happy, Sad, Love, Anger) using the Rasa framework.
5. **Response Generation**: Based on the predicted emotions, the system generates appropriate text, audio, and activity responses.
6. **Sentiment Analysis**: Weekly progress is analyzed using models like Naive Bayes to provide sentiment insights.
7. **Location-Based Services**: APIs or databases ascertain the user's location to provide tailored professional advice based on sentiment analysis.
8. **Activity and Music Recommendation**: Specific exercises or curated playlists are recommended based on the user's emotional state.

## User Journey

1. **Registration**: New users create accounts and provide necessary information for personalization.
2. **Login**: Users log in using their credentials. Authentication ensures secure access.
3. **Main Functionalities**:
   - **Progress Tracking**: Users monitor their mental health progress over time.
   - **Chatbot**: Enables text-based conversations for support and guidance.
   - **Activities**: Curated exercises tailored to individual needs.
   - **Professional Consultancies**: Access to mental health experts for consultations.
4. **Interaction**: Users input text to initiate conversations, and the system classifies and responds to the input using natural language processing techniques.
5. **End Session**: Users can terminate their interaction at any time using the "Stop" option.

## Implementation

### Data Pre-processing

1. **Loading the Dataset**: The dataset containing tweets and their associated emotions is loaded.
2. **Cleaning the Tweets**: Special characters, URLs, and mentions are removed, and the text is converted to lowercase.
3. **Label Encoding**: Emotion labels are converted into numerical values.
4. **Processing and Saving Data**: Each tweet is processed, cleaned, and saved into a new CSV file with encoded labels.
5. **Final Output**: A cleaned dataset ready for further analysis or training machine learning models.

### Rasa Framework

#### Natural Language Understanding (NLU)

Intent classification is performed to map input text to predefined intents. The goal is to assign a probability distribution over intents given an input text, represented as P(intent | x), where intent is one of the predefined intents.

## Features

- **Chatbot Interface**: Engages users in text-based conversations and provides personalized recommendations.
- **Activity Recommendation**: Suggests exercises or activities based on emotional needs.
- **Music Recommendation**: Offers curated playlists to enhance mood or relaxation.
- **Sentiment Analysis**: Provides weekly progress analysis and insights.
- **Location-Based Services**: Delivers professional advice based on user's location.
- **Secure Authentication**: Ensures secure access through credential validation.
- **Progress Visualization**: Users can visualize their mental health progress over time.

## Demo Video
[Demo Video](https://roopesh-s.netlify.app/assets/images/mindcare/mindcare.mp4)

## Installation

To set up the project locally on Windows using Command Prompt, follow these steps:

#### Prerequisites

##### Note: You can download these from Prerequisites folder. This project works on Windows.

Python 3.8.10 <a href="https://www.python.org/downloads/release/python-3810/">Click here to download Python | Windows installer (64-bit) </a>

Xamp Server | <a href="https://drive.google.com/drive/folders/1VWBui22ZbwpNicrmTKjjtMuAU2Eyn0sb?usp=drive_link">Click here to download XAMP and Database</a> <br>
After completing the installation and setup, create new database with the name 'mind_care' and import the database on phpMyAdmin.  

### Command Prompt 1

1. Clone the repository:
   ```sh
   git clone https://github.com/Roopesh519/Mindcare-Conversation-Chatbot-Rasa-Framework.git
   cd Mindcare-Conversation-Chatbot-Rasa-Framework
   ```

2. Create a virtual environment named `venv`:
   ```sh
   python -m venv venv
   ```

3. Activate the virtual environment:
   ```sh
   venv\Scripts\activate
   ```

4. Install the required dependencies:
   ```sh
   cd Mindcare
   pip install -r requirement.txt
   ```

5. Navigate to the Rasa model directory:
   ```sh
   cd MindCareModal
   ```

6. Run the Rasa server with API and CORS enabled:
   ```sh
   rasa run --enable-api --cors "*"
   ```

### Command Prompt 2

1. Open a new Command Prompt and navigate to the cloned repository directory:
   ```sh
   cd path\to\Mindcare-Conversation-Chatbot-Rasa-Framework
   ```

2. Activate the virtual environment:
   ```sh
   venv\Scripts\activate
   ```

3. Navigate to the Rasa model directory:
   ```sh
   cd Mindcare\MindCareModal
   ```

4. Run the Rasa action server:
   ```sh
   rasa run actions
   ```

### Command Prompt 3

1. Open another new Command Prompt and navigate to the cloned repository directory:
   ```sh
   cd path\to\Mindcare-Conversation-Chatbot-Rasa-Framework
   ```

2. Activate the virtual environment:
   ```sh
   venv\Scripts\activate
   ```

3. Navigate to the Django application directory:
   ```sh
   cd Mindcare\MindCare
   ```

4. Run the Django development server:
   ```sh
   python manage.py runserver
   ```

## Usage

1. **Start the Rasa server**: Follow the steps in Command Prompt 1.
2. **Start the Rasa action server**: Follow the steps in Command Prompt 2.
3. **Start the Django server**: Follow the steps in Command Prompt 3.

You can now interact with the chatbot and use the mental health intervention system through the web interface provided by the Django server.

## Contributing

Contributions are welcome! Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file for more information on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
