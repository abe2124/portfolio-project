import os
from flask import Flask

SECRET_KEY = os.urandom(32)
basedir = os.path.abspath(os.path.dirname(__file__))

# SQLALCHEMY_DATABASE_URI = 'mysql://localhost:3306@localhost:5432/bug_tracker'
SQLALCHEMY_DATABASE_URI = 'mysql://root@localhost:3306/bug_tracker'
SQLALCHEMY_TRACK_MODIFICATIONS = False