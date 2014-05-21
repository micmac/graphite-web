#!/bin/bash

cd $(dirname $0)
. virtualenv/bin/activate
cd webapp
exec gunicorn --bind 0.0.0.0:8000 graphite.wsgi
