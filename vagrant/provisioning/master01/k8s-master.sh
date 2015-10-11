#!/bin/sh

sed -i 's/KUBE_MASTER="--master=http:\/\/127.0.0.1:8080"/KUBE_MASTER="--master=http:\/\/master01:8080"/g' /etc/kubernetes/config

sed -i 's/KUBE_API_ADDRESS="--address=127.0.0.1"/KUBE_API_ADDRESS="--address=0.0.0.0"/g' /etc/kubernetes/apiserver
sed -i 's/KUBE_ETCD_SERVERS="--etcd_servers=http:\/\/127.0.0.1:2379"/KUBE_ETCD_SERVERS="--etcd_servers=http:\/\/master01:4001"/g' /etc/kubernetes/apiserver

echo 'KUBELET_ADDRESSES="--machines=node01,node02"' >> /etc/kubernetes/controller-manager

systemctl enable kube-apiserver.service
systemctl start kube-apiserver.service

systemctl enable kube-controller-manager.service
systemctl start kube-controller-manager.service

systemctl enable kube-scheduler.service
systemctl start kube-scheduler.service

