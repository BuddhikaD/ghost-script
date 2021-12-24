#!/usr/bin/bash

########################################################
# Author: Buddhika Dananjaya                           #
# Info: Script for setting up Docker Ghost CMS         #
# License: MIT (c)                                     #
########################################################

# color pallet
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

printf """$BOLDGREEN

░██████╗░██╗░░██╗░█████╗░░██████╗████████╗░░░░░░██████╗░░█████╗░░█████╗░██╗░░██╗███████╗██████╗░
██╔════╝░██║░░██║██╔══██╗██╔════╝╚══██╔══╝░░░░░░██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔════╝██╔══██╗
██║░░██╗░███████║██║░░██║╚█████╗░░░░██║░░░█████╗██║░░██║██║░░██║██║░░╚═╝█████═╝░█████╗░░██████╔╝
██║░░╚██╗██╔══██║██║░░██║░╚═══██╗░░░██║░░░╚════╝██║░░██║██║░░██║██║░░██╗██╔═██╗░██╔══╝░░██╔══██╗
╚██████╔╝██║░░██║╚█████╔╝██████╔╝░░░██║░░░░░░░░░██████╔╝╚█████╔╝╚█████╔╝██║░╚██╗███████╗██║░░██║
░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═════╝░░░░╚═╝░░░░░░░░░╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝                                                                                                                                                                 

Author: @BuddhikaD
Url: https://github.com/BuddhikaD/ghost-script
"""
# Update the system
sudo apt update && sudo apt upgrade -y

# Configure UFW Firewall
sudo ufw status
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw enable -y
sudo ufw status
sudo apt update && sudo apt upgrade -y 

# Use Certbot to request and download a free certificate from Let’s Encrypt
sudo apt install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt install certbot
sudo certbot certonly --standalone -d example.com

# Install Docker & Docker compose
sudo apt update -y
sudo apt install git
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Ghost
cd ghost
sudo mkdir /opt/ghost_content
sudo mkdir /opt/ghost_mysql
sudo mkdir -p /usr/share/nginx/html
docker-compose up -d
