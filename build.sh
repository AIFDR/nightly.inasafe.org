#!/bin/bash

cd /inasafe
git fetch
git clean -df
git reset --hard origin/develop
scripts/release.sh 3.2.0
mv /tmp/inasafe.3.2.0.zip /build
echo "This is the InaSAFE Nightly Build repo last build at : " > /build/index.html
date >> /build/index.html
touch /build/index.html
