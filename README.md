# dockerstack-kubemaster
This will be having the components which runs the Kube Master Components {APIServer,Controller-Manager,Scheduler}

---

make sure you give the ETCD_SERVER variable when you launch the container

docker run -e "ETCD_SERVER=192.168.1.2:2379" -itd containername:tag

This Container runs the following components

1)Runit
2)Kubernetes-Api Server
3)Kubernetes-Controller Manager
4)Kubernetes-Scheduler

Flannel or Project Calico component will be added soon to this image
