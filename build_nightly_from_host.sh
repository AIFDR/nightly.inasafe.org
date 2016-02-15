#!/bin/bash

cd /home/data/nightly.inasafe.org
docker exec -ti nightlyinasafeorg_cron_1 /bin/bash -c "/build.sh"
