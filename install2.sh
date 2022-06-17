##
##  brew
##

# todo sudo

echo $USER

nvm install node

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


echo "Done. Restart shell."
