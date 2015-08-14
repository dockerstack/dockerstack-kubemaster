FROM fedora:latest

MAINTAINER K.G.R Vamsi

RUN  dnf update -y && dnf install wget tar gzip -y

ADD binary/* /usr/bin/ 

ADD kubernetes.env /etc/kubernetes.env

ADD servicescheck.sh /opt/servicescheck.sh

ADD units/* /etc/systemd/system/

RUN systemctl enable flannel.service kube-apiserver.service kube-controller-manager.service kube-scheduler.service &&\
systemctl start flannel kube-apiserver kube-controller-manager kube-scheduler

EXPOSE 8080 

ENTRYPOINT ["/opt/servicescheck.sh"]