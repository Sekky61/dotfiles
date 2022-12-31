#!/bin/bash
# Assumes $PWD dotfiles

mv ~/.bashrc ~/.bashrc_old # Old .bashrc

cp cfg/.gitconfig cfg/.bashrc cfg/.gdbinit cfg/.tldrrc ~

# copy .bashrc to home
# cp cfg/.bashrc ~

echo 'set completion-ignore-case On' >> /etc/inputrc
