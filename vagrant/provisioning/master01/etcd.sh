#!/bin/sh

sed -i 's/ETCD_LISTEN_CLIENT_URLS="http:\/\/localhost:2379"/ETCD_LISTEN_CLIENT_URLS="http:\/\/0.0.0.0:4001"/g' /etc/etcd/etcd.conf

systemctl enable etcd.service
systemctl start etcd.service
