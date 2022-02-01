sudo yum -y update
sudo dnf install -y vim nano git
sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.4/rhel/8/x86_64/zabbix-release-5.4-1.el8.noarch.rpm
sudo dnf clean all
sudo dnf install -y zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
sudo dnf install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb