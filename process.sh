#!/bin/bash

SOURCE="https://download.geofabrik.de/europe/finland-latest.osm.pbf"

FILE_FULL="finland-latest.osm.pbf"

# https://boundingbox.klokantech.com/
# Large area in Helsinki
BBOX="24.797887,60.12895,25.152024,60.25341"

# Hietalahti, Lapinlahti, Kamppi
#BBOX="24.912106,60.158871,24.938885,60.168607"

if [ ! -f $FILE_FULL ]; then
    wget -O $FILE_FULL $SOURCE
fi



osmium extract --bbox $BBOX $FILE_FULL -f pbf > extracted.pbf