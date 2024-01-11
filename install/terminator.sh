#!/bin/bash
# Assumes $PWD dotfiles

apt-get install terminator

# apply config (symlink)
ls -s ~/.config/terminator/config cfg/terminator_config

# TODO
# make terminator active shell (type number with)
echo "Select terminator as default emulator using: sudo update-alternatives --config x-terminal-emulator"

#sudo update-alternatives --config x-terminal-emulator