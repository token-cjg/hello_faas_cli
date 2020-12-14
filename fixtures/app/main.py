from flask import Flask
import subprocess

# OPENFAAS_URL=http://secretmachine.direct.labs.play-with-docker.com:8080

app = Flask(__name__)

@app.route("/")
def home_view():
	return "<h1>Welcome to Geeks for Geeks</h1>"
