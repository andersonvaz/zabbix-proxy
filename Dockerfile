FROM wdhouse/serverbase

ENV ZABBIX_VERSION 2.4 
RUN wget http://repo.zabbix.com/zabbix/${ZABBIX_VERSION}/ubuntu/pool/main/z/zabbix-release/zabbix-release_${ZABBIX_VERSION}-1+trusty_all.deb -O /tmp/zabbix-release_${ZABBIX_VERSION}-1+trusty_all.deb
RUN	dpkg -i /tmp/zabbix-release_${ZABBIX_VERSION}-1+trusty_all.deb
RUN apt-get update && apt-get install -y zabbix-proxy-sqlite3
RUN	apt-get autoremove -y && apt-get clean
RUN rm -rf /tmp/* /var/tmp/*
COPY ./zabbix/zabbix_proxy.conf /etc/zabbix/zabbix_proxy.conf 
ADD start.sh /start.sh
RUN chmod 755 /start.sh
