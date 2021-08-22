#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Updating and Upgrading"
apt-get update && apt-get upgrade -y

# apt install of common programs
echo "Installing common programs"
apt-get install gcc curl git gnome-tweaks -y

# VS code
snap install --classic code
#todo apply settings, extensions

#Chrome
echo "Installing Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get install google-chrome-stable -y

# bat
echo -n "Install bat here -> "
curl --silent "https://github.com/sharkdp/bat/releases/latest" |
    grep 'href=' |                                              
    sed -E 's/.*"([^"]+)".*/\1/'
    