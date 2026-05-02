from flask import Flask
from flask import (Flask, g, render_template, request, flash,url_for, redirect, session, json, jsonify)

app = Flask(__name__)

@app.route("/")
def hello_world():
    return render_template("index.html") 