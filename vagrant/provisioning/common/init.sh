#!/bin/sh

yum -y update

yum -y install epel-release docker

systemctl stop firewalld.service
systemctl mask firewalld.service
