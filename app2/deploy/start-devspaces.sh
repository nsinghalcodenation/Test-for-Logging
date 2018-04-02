#!/bin/bash

# This is the startup script to deploy the Django app with an Apache webserver
# This is to be used in a devspace, as it cleanly moves around files for a
# proper configuration
set -e

# Perform all migrations and collect static files
# Overwrites the static files if they already exist
python /data/app2/manage.py migrate
python /data/app2/manage.py collectstatic --noinput --clear

# Copies over the apache-conf.conf file to the default conf location
export WSGI_CONF=/etc/apache2/sites-available/000-default.conf
cp /data/app2/deploy/apache-conf.conf $WSGI_CONF

# During testing, Apache may require permissions to the folder containing the
# test database and the database itself
if [ -f test_db ]; then
    chmod o+rw test_db
    chmod o+rw .
fi

# Runs the Apache server in the foreground
apache2ctl -D FOREGROUND