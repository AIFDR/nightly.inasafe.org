#!/bin/bash

docker-compose build
docker-compose kill
docker-compose rm
docker-compose up -d
./build_nightly_from_host.sh
