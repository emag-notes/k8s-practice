#!/bin/sh

echo "SEARCH_BACKEND=sqlalchemy" >> /etc/sysconfig/docker-registry
sed -i 's/tmp\/docker-registry.db/var\/lib\/docker-registry\/docker-registry.db/g' /etc/docker-registry.yml
echo "INSECURE_REGISTRY='--insecure-registry master01:5000'" >> /etc/sysconfig/docker

mkdir /var/lib/docker-registry
systemctl enable docker-registry.service
systemctl start docker-registry.service

systemctl enable docker.service
systemctl start docker.service

