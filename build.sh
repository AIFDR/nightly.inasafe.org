#!/bin/bash

cd /inasafe
git checkout experimental > /tmp/nightly.log
git fetch >> /tmp/nightly.log
git clean -df >> /tmp/nightly.log
git reset --hard origin/experimental >> /tmp/nightly.log
VERSION=`cat metadata.txt | grep ^version | sed 's/version=//g'`
scripts/release.sh >> /tmp/nightly.log
mv /tmp/inasafe.${VERSION}.zip /build
mv /tmp/InaSAFE-${VERSION}-plugin.exe /build
cat /build/header.html > /build/index.html
echo "<p class='text-center'>This is the InaSAFE Experimental Build repo last build at : " >> /build/index.html
date >> /build/index.html
echo "</p><p class='text-center'>Windows installer <a href='/InaSAFE-${VERSION}-plugin.exe'>InaSAFE-${VERSION}-plugin.exe</a></br>" >> /build/index.html
echo "</p><p class='text-center'>Plugin repo: http://experimental.inasafe.org/plugins.xml" >> /build/index.html
echo "</p><p class='text-center'>Usage: <a href='https://github.com/AIFDR/inasafe/wiki/Experimental-build-repo'>instructions</a>" >> /build/index.html
echo "</p><p class='text-center'>Build log: <a href='/log.txt'>View" >> /build/index.html
echo "</a>" >> /build/index.html
echo "</p>" >> /build/index.html
cat /build/footer.html >> /build/index.html
touch /build/index.html
cp /build/plugins.xml.tmpl /build/plugins.xml
rpl "[[VERSION]]" "${VERSION}" /build/plugins.xml
DATE=`date`
rpl "[[DATE]]" "${DATE}" /build/plugins.xml
mv /tmp/nightly.log /build/log.txt
