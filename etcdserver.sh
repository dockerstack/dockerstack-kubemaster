#!/bin/bash

echo "ETCD_SERVER=$ETCD_SERVER" >/opt/etcdserver

cat /opt/etcdserver >>/opt/envvars

runsvdir -P /etc/service

