FROM ubuntu:14.04
MAINTAINER tim@kartoza.com

RUN apt-get -y update
RUN apt-get -y install git rpl zip
RUN git clone git://github.com/AIFDR/inasafe.git

ADD package-cron /etc/cron.d/package-cron
RUN touch /var/log/cron.log
CMD ["/usr/sbin/cron", "-f"]
