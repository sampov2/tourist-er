#!/bin/bash

set -e

echo 'localhost:5432:gis:docker:'$(cat /tmp/PGPASSWORD.txt) > $HOME/.pgpass
chmod 0600 $HOME/.pgpass

osm2pgsql --host=localhost --port=5432 --database=gis --user=docker /tmp/input.pbf
