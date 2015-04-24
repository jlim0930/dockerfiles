FROM centos7:latest
MAINTAINER jlim0930 <jlim0930@gmail.com>

RUN yum -y update && yum -y install squid && yum clean all

EXPOSE 3128

COPY run.sh /run.sh
RUN chmod +x run.sh

CMD ["/run.sh"]
