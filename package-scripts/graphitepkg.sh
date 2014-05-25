#!/bin/bash

set -ex
scriptdir=$(dirname $0)
cd $(dirname "$scriptdir")
virtualenv --distribute virtualenv
. virtualenv/bin/activate
pip install -r requirements.txt

"$scriptdir/todeb.sh" "$(date +%Y%m%d)"
