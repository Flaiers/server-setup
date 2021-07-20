#!/bin/bash
python_interpreter=""
project_name=""
app_name=""

read -p "Python interpreter: " python_interpreter
read -p "Project name: " project_name
read -p "App name: " app_name


`$python_interpreter -m venv env`
source env/bin/activate

pip install -U pip
pip install -r requirements.txt

`django-admin startproject $project_name`

`cd $project_name`

`python manage.py startapp $app_name`

python manage.py runserver