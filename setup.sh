#!/bin/bash

#
# Linux Mint Dev Env Setup
#

#
# Snapd
# Git
# Vim
# Google Chrome
# Firefox
# VLC
# Visual Studio Code
# NodeJS & npm
# Docker
# Docker Compose
#

echo ""
echo "Installation started !"
echo ""

sudo -v

sudo apt update
sudo apt upgrade -y

sudo apt install mint-meta-codecs

sudo apt install git
sudo apt install snapd
sudo apt install vim

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

sudo snap install firefox
sudo snap install vlc
sudo snap install code --classic

# Git
read -p "Enter Your Name: " name
read -p "Enter Your Email: " email

git config --global user.name $name
git config --global user.email $email

ssh-keygen -t rsa -b 4096 -C $email

# NodeJS & npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install node

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clean
sudo apt autoclean
sudo apt clean
sudo apt autoremove

echo ""
echo "Installation completed !"
echo ""

exit 0
