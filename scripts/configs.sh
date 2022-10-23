#!/bin/bash
# Assumes $PWD dotfiles

mv ~/.bashrc ~/.bashrc_old # Old .bashrc

cp cfg/.gitconfig cfg/.bashrc cfg/.gdbinit cfg/.tldrrc ~

echo 'set completion-ignore-case On' >> /etc/inputrc
