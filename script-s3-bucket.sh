#!/bin/bash
sudo wget -O /root/git-setup.sh https://wordpress-bucket-s3.s3.eu-north-1.amazonaws.com/git-automate.sh
sudo chmod 755 git-setup.sh
sudo bash git-setup.sh
