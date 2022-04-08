##
##  brew
##

# todo no sudo

# todo remove brew

echo $USER

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh </dev/null)"
echo "Follow Brew instructions above"

# depends on username !

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

##
##  exa
##

brew install exa # todo exa is on newer ubuntu

echo "Done. Restart shell."
