#!/bin/bash
# Assumes $PWD dotfiles

mv ~/.bashrc ~/.bashrc_old # Old .bashrc
mkdir -p ~/.ssh

# symlink .bashrc and others to dotfiles
ln -s ~/dotfiles/cfg/.bashrc ~/.bashrc
ln -s ~/dotfiles/cfg/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/cfg/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/cfg/.gdbinit ~/.gdbinit
ln -s ~/dotfiles/cfg/.tldrrc ~/.tldrrc
ln -s ~/dotfiles/cfg/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/cfg/.xprofile ~/.xprofile

# case insensitive tab completion
echo 'set completion-ignore-case On' >> /etc/inputrc
