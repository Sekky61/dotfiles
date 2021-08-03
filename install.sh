#!/bin/bash

echo "Updating and Upgrading"
apt-get update && sudo apt-get upgrade -y

#gcc
apt install gcc

#curl
apt install curl

#Install git
echo "Installing Git, please congiure git later..."
apt install git -y

#Chrome
echo "Installing Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get update 
apt-get install google-chrome-stable -y