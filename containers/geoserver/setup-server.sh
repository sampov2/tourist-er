#!/bin/bash

set -e

export AUTH="admin:bNJNeijxW8U1M0H"
export API="http://localhost:32769/geoserver/rest"

#curl -i -X POST $API/workspaces -u $AUTH -H "Content-Type: application/json" \
#    -d '{"workspace":{"name":"hello","href":"http://www.osm.com"}}'

read -r -d '' VAR <<- EOM
{
    "dataStore": {
        "name": "nyc",
        "connectionParameters": {
            "entry": [
                {"@key":"database","$":"file:///path/to/nyc.gpkg"},
                {"@key":"dbtype","$":"geopkg"}
            ]
        }
    }
}
EOM
echo $VAR