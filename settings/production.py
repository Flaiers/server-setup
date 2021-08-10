from .base import env

# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {

    # Use PostgreSQL: add to requirements psycopg2
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': env('POSTGRES_DB'),
        'USER': env('POSTGRES_USER'),
        'PASSWORD': env('POSTGRES_PASSWORD'),
        'HOST': env('HOST'),
        'PORT': 5432,
    },

    # Use MySQL: add to requirements mysqlclient
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': env('MYSQL_DATABASE'),
        'USER': env('MYSQL_USER'),
        'PASSWORD': env('MYSQL_PASS'),
        'HOST': env('HOST'),
        'PORT': 3306,
    }
}
