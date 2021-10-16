sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.4/rhel/7/x86_64/zabbix-release-5.4-1.el7.noarch.rpm
sudo yum clean all
sudo yum install -y zabbix-agent
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent