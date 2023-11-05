# Features to use for the analysis

Roads

Buildings

Land usage

Waterways, waterareas - BUT what about the sea?!

Barriers!

## Walkability score per grid cell

If there is a barrier => 0

If 


## TODO:

I might want to create my on mappings.json to normalize data in the database appropriately for my use case


## Development

Run the compose normally:
`docker-compose up`

To rebuild only the database, run:

`docker-compose up -d --build postgis`

## How to retrieve geoserver configuration

```shell
docker exec CONTAINER tar Ccf $(dirname /opt/geoserver/data_dir) - $(basename /opt/geoserver/data_dir) | tar Cxf containers/geoserver/data -
```
