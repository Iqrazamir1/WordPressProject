#!/bin/bash
sudo apt -y update 
sudo apt -y upgrade
sudo apt -y install nginx

# Starts and enables nginx on a server reboot. The 2nd command will only run if the first command is successful. 
sudo systemctl start nginx && sudo systemctl enable nginx 

# Install Mariadb modules 
sudo apt -y install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb

# Install PHP modules 
sudo apt -y install php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
