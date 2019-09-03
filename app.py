import time
from flask import Flask, render_template, session, request

app = Flask(__name__)



@app.route('/')
def hello():
    return render_template('index.html')



