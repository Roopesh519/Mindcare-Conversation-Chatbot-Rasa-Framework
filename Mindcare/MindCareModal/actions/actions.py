
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
# import spotipy
# from spotipy.oauth2 import SpotifyOAuth

import random
from typing import Any, Text, Dict, List

class UtterHappyQuestionsResponse(Action):
    def name(self) -> Text:
        return "action_happy_response"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
    
        # Get the original response from the domain
        response_dict = random.choice(domain['responses']['utter_happy_questions_response'])

        response_text = response_dict.get('text', '')

        # Send the 'text' property to the user
        dispatcher.utter_message(text=response_text, json_message={"emotion": "happy"})

        return []



class UtterSadQuestionsResponse(Action):
    def name(self) -> Text:
        return "action_sad_response"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        response_dict = random.choice(domain['responses']['utter_sad_questions_response'])
        response_text = response_dict.get('text', '')
        # Send the 'text' property to the user
        dispatcher.utter_message(text=response_text, json_message={"emotion": "sad"})

        return []

class UtterAngryQuestionsResponse(Action):
    def name(self) -> Text:
        return "action_angry_response"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        response_dict = random.choice(domain['responses']['utter_angry_questions_response'])
        response_text = response_dict.get('text', '')
        # Send the 'text' property to the user
        dispatcher.utter_message(text=response_text, json_message={"emotion": "angry"})

        return []

class UtterNeutralQuestionsResponse(Action):
    def name(self) -> Text:
        return "action_neutral_response"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        response_dict = random.choice(domain['responses']['utter_neutral_questions_response'])
        response_text = response_dict.get('text', '')
        # Send the 'text' property to the user
        dispatcher.utter_message(text=response_text, json_message={"emotion": "neutral"})

        return []

class UtterFearfulQuestionsResponse(Action):
    def name(self) -> Text:
        return "action_fearful_response"

    def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        response_dict = random.choice(domain['responses']['utter_fearful_questions_response'])
        response_text = response_dict.get('text', '')
        # Send the 'text' property to the user
        dispatcher.utter_message(text=response_text, json_message={"emotion": "fearful"})

        return []




















# SPOTIPY_CLIENT_ID = 'ca773227cdd442ed90e09d13762bba41'
# SPOTIPY_CLIENT_SECRET = 'df63bba4b0064d228ec9427762471599'
# SPOTIPY_REDIRECT_URI = 'http://localhost:5005/callback'

# sp = spotipy.Spotify(
#     auth_manager=SpotifyOAuth(
#         client_id=SPOTIPY_CLIENT_ID,
#         client_secret=SPOTIPY_CLIENT_SECRET,
#         redirect_uri=SPOTIPY_REDIRECT_URI,
#         scope="playlist-read-private"
#     )
# )

# class ActionRecommendPlaylist(Action):
#     def name(self):
#         return "action_recommend_playlist"

#     def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: dict) -> list[dict]:
#         try:
#             emotion = tracker.latest_message['intent']['name']

#             # Your logic to fetch and provide a playlist URL from Spotify API
#             playlist_url = self.get_spotify_playlist(emotion)

#             dispatcher.utter_message(response="utter_recommend_playlist", playlist_url=playlist_url)
#             return []
#         except Exception as e:
#             print(f"Error in action_recommend_playlist: {e}")

#     def get_spotify_playlist(self, emotion: str):
#         # Your logic to fetch the playlist URL from Spotify API based on the emotion
#         # Example: Using spotipy to search for playlists
#         playlists = sp.search(q=emotion, type='playlist', limit=1)
#         playlist_url = playlists['playlists']['items'][0]['external_urls']['spotify']
#         return playlist_url if playlist_url else "https://www.spotify.com"



    