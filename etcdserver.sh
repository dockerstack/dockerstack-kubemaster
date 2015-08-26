#!/bin/bash

echo "ETCD_SERVER=$ETCD_SERVER" >/opt/etcdserver

echo "ETCD_PREFIX=$ETCD_PREFIX" >/opt/etcdserver

cat /opt/etcdserver >>/opt/envvars

runsvdir -P /etc/service

