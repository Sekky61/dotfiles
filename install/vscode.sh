#!/bin/bash
# Assumes $PWD dotfiles, git

snap install --classic code

# Create symlink for settings.json
ln -s vscode/settings.json ~/.config/Code/User/settings.json

# Create symlink for keybindings.json
ln -s vscode/keybindings.json ~/.config/Code/User/keybindings.json

# install extensions
cat vscode/extensions_list.txt | while read line 
do
   code --install-extension $line
done
