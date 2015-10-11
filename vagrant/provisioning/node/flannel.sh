#!/bin/sh

curl -L http://master01:4001/v2/keys/coreos.com/network/config -XPUT --data-urlencode value@/vagrant/provisioning/node/flannel-config.json

yum -y install flannel

sed -i 's/FLANNEL_ETCD="http:\/\/127.0.0.1:2379"/FLANNEL_ETCD="http:\/\/master01:4001"/g' /etc/sysconfig/flanneld

systemctl enable flanneld.service

