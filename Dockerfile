FROM ubuntu:14.04

MAINTAINER K.G.R Vamsi <kgrvamsi@yahoo.com>

RUN apt-get update && \
    apt-get -y install git curl build-essential runit && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

ADD hyperkube /opt/

ADD envvars /opt/envvars

ADD apiserver/* /etc/service/apiserver/

ENTRYPOINT ["/usr/sbin/runsvdir-start","sv start apiserver","sv start controller-manager","sv start scheduler"]
