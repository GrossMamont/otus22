#!/bin/bash

#Обновимся
echo "Обновимся"
sudo apt-get update
sudo apt-get -y upgrade
echo "Установите репозиторий Zabbix"
sudo wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.0+ubuntu22.04_all.deb
sudo dpkg -i zabbix-release_latest_7.0+ubuntu22.04_all.deb
sudo apt update

echo "Установите Zabbix сервер, веб-интерфейс и агент"
sudo apt -y install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent mysql-server mc

