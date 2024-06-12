#!/bin/bash
sudo apt -y install git 
cd /root/
sudo git clone https://github.com/Iqrazamir1/WordPressProject.git
chmod -R 755 WordPressProject
sudo bash WordPressProject/lemp-automate.sh
