#!/bin/bash
sudo apt -y install git 
sudo cd /root/
sudo git clone https://github.com/Iqrazamir1/WordPressProject.git
sudo chmod -R 755 WordPressProject
sudo bash WordPressProject/lemp-automate.sh

# Change directory to /var/www/html/
cd /var/www/html/
 
# Rename the default Apache test page if it exists
sudo mv index.html index.html.old
