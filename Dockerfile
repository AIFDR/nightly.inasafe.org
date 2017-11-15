FROM ubuntu:14.04
MAINTAINER tim@kartoza.com

ADD build.sh /build.sh
RUN apt-get -y update
RUN apt-get -y install git rpl zip make nsis
RUN apt-get -y install python-pip
RUN pip install git-archive-all pep8
RUN git clone git://github.com/inasafe/inasafe.git

ADD package-cron /etc/cron.d/package-cron
RUN chmod +x /etc/cron.d/package-cron
ADD build.sh /build.sh
RUN chmod +x /build.sh
RUN touch /var/log/cron.log
CMD ["/usr/sbin/cron", "-f"]
