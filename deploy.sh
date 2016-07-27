#!/bin/bash

docker-compose build
docker-compose kill
docker-compose rm
docker-compose up -d
# It should run its own cron inside the container
# but that isnt working so we run from cron on the host
./build_nightly_from_host.sh
