#!/bin/bash
set -e

if [ ! -z "$SCRAPE_ENDPOINT" ]
then
    sed -i s/localhost:9090/$SCRAPE_ENDPOINT/g /etc/prometheus/prometheus.yml
fi

if [ -z "$STORAGE_PATH" ]
then
   STORAGE_PATH=/prometheus
fi


exec "$@" --web.listen-address="0.0.0.0:${PORT}" --storage.tsdb.path=$STORAGE_PATH