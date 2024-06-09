import random
import uuid


def global_constants(request):
    # Define your global constants here
    return {
        'APP_NAME': 'Mind Care',
    }


playlist = {
    'happy': [
        "https://open.spotify.com/embed/playlist/4XCCOQSZcfqMGPlnC5C1JS?utm_source=generator&theme=0",
        "https://open.spotify.com/embed/artist/4YRxDV8wJFPHPTeXepOstw?utm_source=generator&theme=0"
    ],
    'sad': [
        "https://open.spotify.com/embed/playlist/4jauau84UpL3AW3t16nfgY?utm_source=generator&theme=0",
        "https://open.spotify.com/embed/artist/4mLssk852x2M3v2L1epSWM?utm_source=generator&theme=0"
    ]
}


def get_random_music(mood):
    # Check if the mood exists in the playlist
    if mood in playlist:
        # Get a random item from the playlist
        random_music = random.choice(playlist[mood])
        return random_music
    else:
        return None  # Return None if the specified mood is not found in the playlist

   
def generate_unique_id():
    unique_id = str(uuid.uuid4())[:14]  # Generate a UUID and take the first 14 characters
    formatted_id = '-'.join([unique_id[i:i+4] for i in range(0, len(unique_id), 4)])
    return formatted_id




