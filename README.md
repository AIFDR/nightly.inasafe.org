# nightly.inasafe.org

Docker scripts for nightly builds at http://nightly.inasafe.org

See https://github.com/AIFDR/inasafe/wiki/Nightly%20Builds


To manually build:

```
./deploy.sh
```

# Run on cron from the host:

```
#!/bin/bash

# Build nightly InaSAFE (off develop branch)                                                                                                                                 
/home/data/nightly.inasafe.org/build_nightly_from_host.sh 2>&1 > /tmp/nightly.log
# Build experimental InaSAFE (off experimental branch)
/home/data/experimental.inasafe.org/build_nightly_from_host.sh 2>&1 > /tmp/experimental.log
# Make backups for the blog
cd /home/data/inasafe.org && make dbbackup && make wpbackup
# Backup the changelog stuff too
/home/data/changelog.inasafe.org/deployment/manual_backup.sh
```

# experimental.inasafe.org

Docker scripts for experimental builds at http://experimental.inasafe.org

See https://github.com/inasafe/inasafe/wiki/Experimental-build-repo


To manually build:

```
git branch experimental
git checkout experimental
./deploy.sh
```

