#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# setup symlink for .bashrc and .fancy-bash-prompt.sh
# -s symbolic link instead of hard link
ln -s ".bashrc" ~
ln -s ".fancy-bash-prompt.sh" ~

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
apt-get install gcc curl gnome-tweaks jq imwheel fonts-powerline exa preload -y

##
##  Rust
##

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
ldconfig # not sure if necessary, load program names used later in script
rustup component add clippy 

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

##
##  brew
##

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Follow Brew instructions above"

##
##  exa
##

brew install exa

#todo temp folder for temp files

# probably done: todo add imwheel to startup apps
  
echo "Done. Restart shell"

# What else to do? https://www.youtube.com/watch?v=GrI5c9PXS5k
# allow partner repositories
# set DNS to 1.1.1.1 and 1.0.0.1
# czech layout in settings > region
