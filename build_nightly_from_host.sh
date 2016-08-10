#!/bin/bash

cd /home/data/experimental.inasafe.org
# Don't use -i as we run this in cron which is non interactive
docker exec -t experimentalinasafeorg_cron_1 /bin/bash -c "/build.sh" 
