#!/bin/bash

IMPOSM_VERSION="0.11.1"

set -e

echo 'localhost:5432:gis:docker:'$(cat /run/secrets/POSTGRES_PASS) > $HOME/.pgpass
chmod 0600 $HOME/.pgpass

wget -O /tmp/imposm.tar.gz https://github.com/omniscale/imposm3/releases/download/v$IMPOSM_VERSION/imposm-$IMPOSM_VERSION-linux-x86-64.tar.gz

cd /tmp/
tar xf imposm.tar.gz

IMPOSM_DIR=/tmp/imposm-$IMPOSM_VERSION-linux-x86-64
IMPOSM_MAPPING=$IMPOSM_DIR/mapping.json

POSTGIS_CONNECTION=postgis://docker:$(cat /run/secrets/POSTGRES_PASS)@localhost:5432/gis

$IMPOSM_DIR/imposm import -mapping $IMPOSM_DIR/mapping.json -read /tmp/input.pbf
$IMPOSM_DIR/imposm import -mapping $IMPOSM_DIR/mapping.json -write -connection $POSTGIS_CONNECTION 

$IMPOSM_DIR/imposm import -mapping $IMPOSM_DIR/mapping.json -connection $POSTGIS_CONNECTION -deployproduction
$IMPOSM_DIR/imposm import -mapping $IMPOSM_DIR/mapping.json -connection $POSTGIS_CONNECTION -removebackup

