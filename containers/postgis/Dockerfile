FROM kartoza/postgis:16-3.4

RUN apt-get update -y
RUN apt-get install osm2pgsql -y

COPY input.pbf /tmp

#COPY init.sh /docker-entrypoint.initdb.d/
COPY init.sh /docker-entrypoint-initdb.d/