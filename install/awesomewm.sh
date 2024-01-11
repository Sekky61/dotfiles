#!/bin/bash
# Assumes $PWD dotfiles

apt-get install awesome -y

# link config dir
ln -s ~/dotfiles/awesome ~/.config/awesome
