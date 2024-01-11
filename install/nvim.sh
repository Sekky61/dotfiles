#!/bin/bash
# Assumes $PWD dotfiles

apt-get install neovim -y

# link config dir
ln -s ~/.config/nvim nvim
