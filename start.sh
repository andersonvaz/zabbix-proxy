#!/bin/bash
echo " "
if [ -z "$ZABBIX_HOST" ]; then
	echo "Hostname=$ZABBIX_HOST" >> /etc/zabbix/zabbix_proxy.conf
else
	echo "Hostname=$(cat /etc/hostname)" >> /etc/zabbix/zabbix_proxy.conf
fi
if [ -z "$ZABBIX_SERVER" ]; then
	echo "Server=$ZABBIX_SERVER" >> /etc/zabbix/zabbix_proxy.conf
else
	echo "Server=127.0.0.1" >> /etc/zabbix/zabbix_proxy.conf
fi
service zabbix-proxy start
echo "Start ssh server"
/usr/sbin/sshd -D