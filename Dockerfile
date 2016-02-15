FROM ubuntu:14.04
MAINTAINER tim@kartoza.com

RUN apt-get -y update
RUN apt-get -y update
RUN apt-get -y install git rpl zip make nsis
RUN git clone git://github.com/AIFDR/inasafe.git

ADD package-cron /etc/cron.d/package-cron
RUN chmod +x /etc/cron.d/package-cron
ADD build.sh /build.sh
RUN chmod +x /build.sh
RUN touch /var/log/cron.log
CMD ["/usr/sbin/cron", "-f"]
