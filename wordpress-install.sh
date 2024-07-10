#!/bin/bash

# Step 1: Install WordPress
wget https://wordpress.org/latest.zip
sudo apt install unzip
sudo unzip latest.zip -d /var/www/html/

# Step 2: Create a Database and User for WordPress Site
sudo mariadb -u root
create database wordpress;
create user wpuser@localhost identified by 'your-password';
grant all privileges on wordpress.* to wpuser@localhost;
flush privileges;
exit;

# Step 3: Configure WordPress
cd /var/www/html/wordpress/
sudo cp wp-config-sample.php wp-config.php
sudo vim wp-config.php

Edit the below in the wp-config.php file

  /** The name of the database for WordPress */
  define('DB_NAME', 'wordpress');

  /** MySQL database username */
  define('DB_USER', 'wpuser');

  /** MySQL database password */
  define('DB_PASSWORD', 'password_here');

sudo chmod 640 wp-config.php
sudo chown www-data:www-data /var/www/html/wordpress/ -R

# Step 4: Create an Nginx Server Block for WordPress
sudo vim /var/www/html/wordpress/ # Update the server_name and root (The root path is: /var/www/html/wordpress/;)
sudo nginx -t
sudo systemctl reload nginx
