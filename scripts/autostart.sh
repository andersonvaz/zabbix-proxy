#!/bin/bash
service zabbix-proxy start
echo "Start ssh server"
/usr/sbin/sshd -D