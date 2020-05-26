#!/bin/bash

mkdir -p /tmp/keepalived

logger "keepalived notify CALLED - $1"

# master -> ip address add dev eth1 ${vipAddress}
# backup -> ip address del dev eth1 ${vipAddress}
if [ "$1" = "master" ]; then
  rm -f /tmp/keepalived/BACKUP
  logger "keepalived became MASTER"
  touch /tmp/keepalived/MASTER
else
  rm -f /tmp/keepalived/MASTER
  logger "keepalived became BACKUP"
  touch /tmp/keepalived/BACKUP
fi
