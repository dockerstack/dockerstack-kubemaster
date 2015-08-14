FROM fedora:latest

MAINTAINER K.G.R Vamsi

RUN  dnf update -y && dnf install wget tar -y &&\
wget https://github.com/kubernetes/kubernetes/releases/download/v1.0.1/kubernetes.tar.gz  &&\
wget https://github.com/coreos/etcd/releases/download/v2.1.1/etcd-v2.1.1-linux-amd64.tar.gz -o etcd-v2.1.1-linux-amd64.tar.gz \
wget https://github.com/coreos/flannel/releases/download/v0.5.2/flannel-0.5.2-linux-amd64.tar.gz &&\
tar -xvf etcd-v2.1.1-linux-amd64.tar.gz &&\
tar -xvf flannel-0.5.2-linux-amd64.tar.gz && tar -xvf kubernetes.tar.gz && tar -xvf kubernetes/server/kubernetes-server-linux-amd64.tar.gz  &&\
cp -rf flannel-0.5.2/flanneld /usr/bin/  && cp -rf etcd-v2.1.1-linux-amd64/etcdctl /usr/bin/ &&\
cp -rf kubernetes/server/bin/kube-apiserver kubernetes/server/bin/kube-controller-manager kubernetes/server/kube-scheduler /usr/bin/ \

ADD kubernetes.env /etc/kubernetes.env

ADD servicescheck.sh /opt/servicescheck.sh

ADD units/* /etc/systemd/system/

RUN systemctl enable flannel.service kube-apiserver.service kube-controller-manager.service kube-scheduler.service
&& systemctl start flannel kube-apiserver kube-controller-manager kube-scheduler

EXPOSE 8080 

ENTRYPOINT ["/opt/servicescheck.sh"]