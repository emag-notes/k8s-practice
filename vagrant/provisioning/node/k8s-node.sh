#!/bin/sh

yum -y install kubernetes-node

sed -i 's/KUBE_MASTER="--master=http:\/\/127.0.0.1:8080"/KUBE_MASTER="--master=http:\/\/master01:8080"/g' /etc/kubernetes/config

sed -i 's/KUBELET_ADDRESS="--address=127.0.0.1"/KUBELET_ADDRESS="--address=0.0.0.0"/g' /etc/kubernetes/kubelet
sed -i 's/KUBELET_HOSTNAME="--hostname_override=127.0.0.1"/#KUBELET_HOSTNAME="--hostname_override=127.0.0.1"/g' /etc/kubernetes/kubelet
sed -i 's/KUBELET_API_SERVER="--api_servers=http:\/\/127.0.0.1:8080"/KUBELET_API_SERVER="--api_servers=http:\/\/master01:8080"/g' /etc/kubernetes/kubelet

systemctl enable kube-proxy.service
systemctl start kube-proxy.service

systemctl enable kubelet.service
systemctl start kubelet.service
