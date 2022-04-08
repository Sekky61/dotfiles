#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# todo enforce run from dotfiles directory (relative paths break)

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

git config --global user.name "Michal Majer"
git config --global user.email "misa@majer.cz"

# setup hard link for .bashrc and .fancy-bash-prompt.sh
# -s symbolic link instead of hard link

#todo should delete old .bashrc ?
cp ".bashrc" ~
cp ".fancy-bash-prompt.sh" ~

echo "Updating and Upgrading"
apt-get update && apt-get upgrade -y

##
##  Apt programs
##

# imwheel         - mousewheel fix
# jq              - JSON parser
# gnome-tweaks    - wallpaper, themes
# fonts-powerline - fancy prompt font
echo "Installing common programs"
apt-get install make gcc g++ curl gnome-tweaks npm jq imwheel fonts-powerline thefuck python3-distutils preload -y
# exa is for ubu > 2.10

##
##  Rust
##

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
ldconfig # not sure if necessary, load program names used later in script

source $HOME/.cargo/env

##
##  VS Code
##

snap install --classic code
# install settings
git clone https://github.com/Sekky61/vscode-settings.git
cp vscode-settings/settings.json vscode-settings/keybindings.json ~/.config/Code/User

# install extensions
cat vscode-settings/extensions_list.txt | while read line 
do
   code --install-extension $line
done

#remove temp folder
rm -rf vscode-settings

##
##  Chrome
##

echo "Installing Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get install google-chrome-stable -y

##
##  bat
##

echo "Installing bat"
curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/sharkdp/bat/releases/latest \
  | jq '[.assets | .[] | select(.name | contains("amd64.deb"))] | last | .browser_download_url' \
  | xargs -L 1 wget

dpkg -i bat* # install package
rm -rf bat* # cleanup

## npm nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "After restart:\n\tnvm install node"

## ssh folder 

mkdir -p ~/.ssh
cp ssh_config ~/.ssh/config

# theme
# guide https://www.omgubuntu.co.uk/2017/03/make-ubuntu-look-like-mac-5-steps

unzip Mojave-dark.zip
mkdir -p ~/.themes
mv Mojave-dark ~/.themes/Mojave-dark

# icon set - manual todo
# move to ~/.icons
# https://github.com/keeferrourke/la-capitaine-icon-theme/releases

unzip icons.zip
mkdir -p ~/.icons
mv la-capitaine-icon-theme-0.6.2 ~/.icons/la-capitaine-icon-theme-0.6.2
  
echo "Done. Restart shell. Run install2.sh Open tweaks to change theme"

# todo resume script

# todo apply theme

# todo add chrome icon

#todo temp folder for temp files

# todo case insensitive search

# What else to do? https://www.youtube.com/watch?v=GrI5c9PXS5k
# allow partner repositories
# set DNS to 1.1.1.1 and 1.0.0.1
# czech layout in settings > region
