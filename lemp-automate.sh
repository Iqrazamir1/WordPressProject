#!/bin/bash

# This file will contain the output of our LEMP stack unit tests.
sudo touch /root/testing.txt

sudo apt -y install nginx

# Starts and enables nginx on a server reboot. The 2nd command will only run if the first command is successful. 
sudo systemctl start nginx && sudo systemctl enable nginx 
sudo systemctl start nginx > /root/testing.txt

# Install Mariadb modules 
sudo apt -y install mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb
sudo systemctl start mariadb >> /root/testing.txt

# Install PHP modules 
sudo apt -y install php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
sudo php -v >> /root/testing.txt

# Rename Apache testing page
sudo mv /var/www/html/index.html /var/www/html/index.html.old
sudo mv /root/WordPressProject/nginx.conf /etc/nginx/conf.d/nginx.conf

# DNS Record
dns_record=$(curl -s icanhazip.com | sed 's/^/ec2-/; s/\./-/g; s/$/.compute-1.amazonaws.com/')
sed -i "s/SERVERNAME/$dns_record/g" /etc/nginx/conf.d/nginx.conf

# Reload nginx if the test is successful 
nginx -t && systemctl reload nginx
sudo bash /root/WordPressProject/wordpress-install.sh
