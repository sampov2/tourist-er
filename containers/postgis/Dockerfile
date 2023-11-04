FROM kartoza/postgis:16-3.4

RUN apt-get update -y
RUN apt-get install osm2pgsql -y

RUN wget -O /tmp/imposm.tar.gz https://github.com/omniscale/imposm3/releases/download/v0.11.1/imposm-0.11.1-linux-x86-64.tar.gz

COPY input.pbf /tmp
COPY mapping.json /tmp

COPY init.sh /docker-entrypoint-initdb.d/