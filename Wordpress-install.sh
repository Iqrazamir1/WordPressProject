#!/bin/bash

sudo cd /var/www/html
sudo apt -y install unzip

# Installs latest version of WordPress 
sudo wget https://wordpress.org/latest.zip

# Unzip wordpress file
sudo unzip latest.zip

# Removes the file (clean up)
rm latest.zip

# 
sudo mariadb -u root

# Creates Mariadb database called wordpress 
create database wordpress;

# Creates a user for the database (Football1 is the password)
create user wpuser@localhost identified by 'Football1';

# Grant all privileges to the user
grant all privileges on wordpress.* to wpuser@localhost;

# Apllies everything I've done 
flush privileges;
exit;

# Creates a wp-cofig.php which wordpress will use as the defaulf config 
cp wp-config-sample.php wp-config.php

# Edit config file
vim wp-config.php

# Only group user can read the file
sudo chmod 640 wp-config.php

# 
sudo cd /etc/nginx/conf.d/ 
sudo touch wordpress.conf (pull from s3bucket)












