#!/bin/bash

cd /inasafe
git fetch
git clean -df
git reset --hard origin/develop
VERSION=`cat metadata.txt | grep ^version | sed 's/version=//g'`
scripts/release.sh
mv /tmp/inasafe.${VERSION}.zip /build
mv /tmp/inasafe.${VERSION}-plugin.exe /nbuild
echo "This is the InaSAFE Nightly Build repo last build at : " > /build/index.html
date >> /build/index.html
echo "</br>Windows installer <a href='/inasafe.${VERSION}-plugin.exe'>inasafe.${VERSION}-plugin.exe</a></br>" >> /build/index.html
echo "Plugin repo: http://nightly.inasafe.org/plugins.xml" >> /build/index.html
touch /build/index.html
cp /build/plugins.xml.tmpl /build/plugins.xml
rpl "[[VERSION]]" "${VERSION}" /build/plugins.xml
DATE=`date`
rpl "[[DATE]]" "${DATE}" /build/plugins.xml
