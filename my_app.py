''' Simple Flask Application 
author: Robert Simari (rsimari)
'''

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
	return 'Hello, World'

@app.route('/greet/<username>')
def greet_user(username):
	return 'Hello, {}!'.format(username)
