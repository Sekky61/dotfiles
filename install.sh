#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

exec 1>>out_log 2>>error_log
echo "=== INSTALL ==="

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

git config --global user.name "Michal Majer"
git config --global user.email "misa@majer.cz"

# todo should old .bashrc be deleted ?
cp "${BASH_SOURCE%/*}/cfg/.bashrc" ~

echo "Updating and Upgrading"
apt-get update && apt-get upgrade -y

##
##  Apt programs
##

# gnome-tweaks    - wallpaper, themes
echo "Installing common programs"
apt-get install make clang curl gnome-tweaks npm thefuck python3-distutils preload exa -y


# font
mkdir -p ~/.fonts
cp "${BASH_SOURCE%/*}/Menlo for Powerline.ttf" ~/.fonts
fc-cache -vf ~/.fonts

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
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb # todo temp folder

##
##  bat
##

echo "Installing bat"
cargo install bat

# todo auto or change to install with cargo
# broot
# https://dystroy.org/broot/install/
# move toc
#
# add this to nushell config (todo add config to dotfiles):
#
# def-env br_cmd [] {
#   let cmd_file = (^mktemp | str trim);
#   ^broot --outcmd $cmd_file;
#   let-env cmd = ((open $cmd_file) | str trim);
#   ^rm $cmd_file;
# }
# alias br = (br_cmd | cd ($env.cmd | str replace "cd" "" | str trim))

## npm nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

## ssh folder 

mkdir -p ~/.ssh
cp "${BASH_SOURCE%/*}/cfg/ssh_config" ~/.ssh/config
  
echo "Done. Restart shell. Run install2.sh."

# todo resume script

# todo temp folder for temp files

# todo keyboard shortcuts for nu, suspend

# What else to do? https://www.youtube.com/watch?v=GrI5c9PXS5k
# allow partner repositories
# set DNS to 1.1.1.1 and 1.0.0.1
# czech layout in settings > region

# todo Heroku (?) curl https://cli-assets.heroku.com/install.sh | sh
# todo Insomnia
# todo tool https://github.com/slimm609/checksec.sh/zipball/main
