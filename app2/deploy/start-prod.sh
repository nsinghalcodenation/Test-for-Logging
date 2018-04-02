#!/bin/bash

# This is the startup script used to deploy your Django server with Apache
# in your production environment.
# This script is expected to be executed once; when your docker container starts
set -e

# Perform all migrations and collect static files
python /data/app2/manage.py migrate
python /data/app2/manage.py collectstatic --noinput --clear

# Run the Apache server in the foreground (so that container does not die)
# In case the server dies, the container will stop
apache2ctl -D FOREGROUND
