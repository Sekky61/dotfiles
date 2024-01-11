#!/bin/bash
# Assumes $PWD dotfiles, git

snap install --classic code

# install settings
git clone https://github.com/Sekky61/vscode-settings.git tmp
cp tmp/vscode-settings/settings.json vscode-settings/keybindings.json ~/.config/Code/User

# install extensions
cat tmp/vscode-settings/extensions_list.txt | while read line 
do
   code --install-extension $line
done
