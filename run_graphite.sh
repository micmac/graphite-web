#!/bin/bash

set -ex

cd $(dirname $0)
. virtualenv/bin/activate
cd webapp

DEFAULTS_FILE=/etc/default/graphite-web
GRAPHITE_CONF_DIR=/opt/graphite/conf
GRAPHITE_STORAGE_DIR=/opt/graphite/storage
GRAPHITE_LOCAL_SETTINGS="$GRAPHITE_CONF_DIR/local_settings.py"
if [ -r $DEFAULTS_FILE ]; then
  .  $DEFAULTS_FILE
fi
export ${!GRAPHITE_*}

mkdir -p "${GRAPHITE_STORAGE_DIR}/log/webapp" "$GRAPHITE_CONF_DIR"

ln -sf "$GRAPHITE_LOCAL_SETTINGS" graphite/local_settings.py

exec uwsgi --http-socket 0.0.0.0:8000 --workers 16 --module graphite.wsgi --immediate-uid www-data
