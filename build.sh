#!/bin/bash
python_interpreter=""
first_app_name=""

read -p "----------------------
| Python interpreter |
----------------------
Default: /usr/bin/python3
(Press: Enter for choose default)
If you wont to change, write: " python_interpreter

read -p "
------------------
| First app name |
------------------
Default: core
(Press: Enter for choose default)
If you wont to change, write: " first_app_name


if [ -z "$python_interpreter" ]; then
    /usr/bin/python3 -m venv env
else
    `$python_interpreter -m venv env`
fi

source env/bin/activate
pip install -U pip && pip install --no-cache-dir -r requirements.txt

django-admin startproject config
mv config/ src/ && cd src/

rm config/settings.py
mv ../settings/ config/


if [ -z "$first_app_name" ]; then
    python manage.py startapp core
else
    `python manage.py startapp $first_app_name`
fi

python manage.py collectstatic
python manage.py migrate
python manage.py runserver --insecure