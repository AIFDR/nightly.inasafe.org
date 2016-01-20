# nightly.inasafe.org

Docker scripts for nightly builds at http://nightly.inasafe.org

See https://github.com/AIFDR/inasafe/wiki/Nightly%20Builds


To manually build:

```
docker-compose build
docker-compose up -d
docker exec -ti nightlyinasafeorg_cron_1 /bin/bash -c "/build.sh"
```

