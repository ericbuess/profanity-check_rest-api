import bottle, json
from bottle import route, run, response, template, get
#from profanity_check import predict, predict_prob
from better_profanity import profanity
from youtube_transcript_api import YouTubeTranscriptApi
import urllib.parse

app = bottle.default_app()

@route('/')
def hello_world():
    return "Hello, world!! (From Full Stack Python)"

#@route('/hello/<name>')
#def index(name):
#    return template('<b>Hello {{name}}</b>!<br>This is a test', name=name)

#@get('/profanity-check')
#def listing_handler():
#    '''Handles profanity-check listing'''
#    pass

@get('/profanity-check/<video_id>')
def listing_handler(video_id):
    '''Handles profanity-check for a video with the given video id'''
    response.headers['Content-Type'] = 'application/json'
    response.headers['Cache-Control'] = 'no-cache'

    text = ''
    profanity_detected = False
    censored_text = []

    print(video_id)

    transcript_list = YouTubeTranscriptApi.get_transcript(video_id)

    # iterate over all available transcripts
    for transcript in transcript_list:
        text = transcript['text']
        if profanity.contains_profanity(text):
            profanity_detected = True
            censored_text.append(profanity.censor(text))

    result = {'video-id': video_id,'profanity-detected': profanity_detected, 'censored': censored_text}
#    return json.dumps({'names': list(_names)})
    result = json.dumps(result)
##    return template("<html>{{result}}", result)
    return result
#    return template("<html><body style='background-color:black;color:white;'>{{result}}</body></html>", result)

if __name__ == "__main__":
    profanity.load_censor_words()
    run(host="0.0.0.0", port=8080, debug=True, reloader=True)
