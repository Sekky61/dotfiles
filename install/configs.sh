#!/bin/bash
# Assumes $PWD dotfiles

mv ~/.bashrc ~/.bashrc_old # Old .bashrc
mkdir -p ~/.ssh

# symlink .bashrc and others to dotfiles
ln -s ~/.bashrc ~/dotfiles/cfg/.bashrc
ln -s ~/.gitconfig ~/dotfiles/cfg/.gitconfig
ln -s ~/.gdbinit ~/dotfiles/cfg/.gdbinit
ln -s ~/.tldrrc ~/dotfiles/cfg/.tldrrc

# case insensitive tab completion
echo 'set completion-ignore-case On' >> /etc/inputrc
