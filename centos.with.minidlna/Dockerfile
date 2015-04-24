FROM centos7:latest
MAINTAINER jlim0930 <jlim0930@gmail.com>

RUN yum -y update && yum clean all

EXPOSE 8200

RUN mkdir -p /var/cache/minidlna

COPY minidlnad /usr/sbin/minidlnad
RUN chown root:root /usr/sbin/minidlnad && chmod a+x /usr/sbin/minidlnad

COPY run.sh /run.sh
RUN chmod +x run.sh

CMD ["/run.sh"]
