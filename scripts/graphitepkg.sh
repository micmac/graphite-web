#!/bin/bash

set -ex

cd $(dirname $(dirname $0))
virtualenv --distribute virtualenv
. virtualenv/bin/activate
pip install -r requirements.txt

./scripts/todeb.sh "$(date +%Y%m%d)"
