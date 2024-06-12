#!/bin/bash
sudo apt -y install git 
sudo cd /root/
sudo git clone https://github.com/Iqrazamir1/WordPressProject.git
sudo chmod -R 755 WordPressProject
sudo bash WordPressProject/lemp-automate.sh
