sudo yum install kernel-headers kernel-devel --disableexcludes=all
sudo yum update
sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
sudo yum clean all
sudo yum install zabbix-server-mysql zabbix-agen
sudo yum install centos-release-scl
sudo yum install zabbix-web-mysql-scl zabbix-apache-conf-scl