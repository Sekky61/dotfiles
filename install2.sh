##
##  brew
##

# todo sudo

echo $USER

nvm install node

npm install -g tldr
cp cfg/.tldrrc ~/.tldrrc

echo "Installing mold"
git clone https://github.com/rui314/mold.git
cd mold
git checkout v1.2.1
make -j$(nproc) CXX=g++
make install

# https://github.com/rui314/mold
# Rust: add these lines to ~/.cargo/config.toml
# [target.x86_64-unknown-linux-gnu]
# linker = "clang"
# rustflags = ["-C", "link-arg=-fuse-ld=/path/to/mold"]
#
# 

# add option to /etc/inputrc to enable case-insensitive tab completion for all users
echo 'set completion-ignore-case On' >> /etc/inputrc

# nushell
# https://github.com/nushell/nushell/releases
# move binaries to /usr/bin


echo "Done. Restart shell."
