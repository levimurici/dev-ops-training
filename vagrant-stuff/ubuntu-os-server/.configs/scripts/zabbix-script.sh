sudo wget https://repo.zabbix.com/zabbix/4.4/ubuntu/pool/main/z/zabbix-release/zabbixrelease_4.4-1+bionic_all.deb
sudo dpkg -i zabbix-release_4.4-1+bionic_all.deb
sudo apt update
sudo apt -y install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbixagent