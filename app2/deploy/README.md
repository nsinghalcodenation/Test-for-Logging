# Deploying your Application

## Why use a web-server?
By default, `python manage.py runserver` runs a single threaded server. It does not allow multiple requests to be concurrently processed. 
**This is unacceptable for a production system. Never ever deploy a production server using the default django server**

## Nginx vs Apache
This is a debate that comes down to a matter of choice. We have had a lot of success using Apache, it's the first recommended way to go in the [official Django docs](https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/modwsgi/)

You are free to use nginx if you'd like, and in case you do, please consider adding your configuration to this template as well. 

## Setting up the apache-conf

This is a bit tricky. For the python3.6 installation, you need the pip-installed version of mod_wsgi. You cannot bootstrap this with your apache installation using the usual `a2enmod`. 

To use the Apache mod_wsgi module from where `pip install` placed it, run the command 
```bash
mod_wsgi-express module-config
```
This will output something like:
```
LoadModule wsgi_module "/usr/local/lib/python3.6/site-packages/mod_wsgi/server/mod_wsgi-py36.cpython-36m-x86_64-linux-gnu.so"
WSGIPythonHome "/usr/local"
```

These are the directives needed to configure Apache to load the mod_wsgi module and tell mod_wsgi where the Python installation directory or virtual environment was located. This is placed in the `apache-conf.conf` file.

You can read more about this in the mod_wsgi pip-package documentation: https://pypi.python.org/pypi/mod_wsgi

