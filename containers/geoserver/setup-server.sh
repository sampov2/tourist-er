#!/bin/bash

set -e

export AUTH="admin:$(cat /run/secrets/GEOSERVER_ADMIN_PASSWORD)"
export API="http://localhost:8080/geoserver/rest"

curl -i -X POST $API/workspaces -u $AUTH -H "Content-Type: application/json" \
    -d '{"workspace":{"name":"osm","href":"http://www.osm.com"}}'

#read -r -d '' VAR <<- EOM
#{
#    "dataStore": {
#        "name": "nyc",
#        "connectionParameters": {
#            "entry": [
#                {"@key":"database","$":"file:///path/to/nyc.gpkg"},
#                {"@key":"dbtype","$":"geopkg"}
#            ]
#        }
#    }
#}
#EOM
#echo $VAR