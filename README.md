# Mental Health Intervention System

## Overview

This repository contains the implementation of a Mood Classification and Recommendation System using a dataset and chatbot. The system provides mental health support and guidance through pre-programmed responses, emotional information extraction, activity recommendations, and music recommendations.

## Table of Contents

- [System Architecture](#system-architecture)
- [User Journey](#user-journey)
- [Implementation](#implementation)
  - [Data Pre-processing](#data-pre-processing)
  - [Rasa Framework](#rasa-framework)
    - [Natural Language Understanding (NLU)](#natural-language-understanding-nlu)
- [Features](#features)
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

## Installation

To set up the project locally, follow these steps:

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/mental-health-intervention-system.git
   cd mental-health-intervention-system
   ```

2. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```

3. Set up Rasa:
   ```sh
   rasa init
   ```

4. Run the chatbot:
   ```sh
   rasa run
   ```

## Usage

1. Start the chatbot server:
   ```sh
   rasa run
   ```

2. Interact with the chatbot using the Rasa shell:
   ```sh
   rasa shell
   ```

3. Use the provided functionalities to track progress, get activity and music recommendations, and consult with professionals.
