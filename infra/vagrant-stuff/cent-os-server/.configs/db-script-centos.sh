mysql -uroot -p
password
create database zabbix character set utf8 collate utf8_bin;
create user zabbix@localhost identified by 'zabbix';
grant all privileges on zabbix.* to zabbix@localhost;
quit;