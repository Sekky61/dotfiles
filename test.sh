echo "Rust: add these lines to ~/.cargo/config.toml
[target.x86_64-unknown-linux-gnu]
linker = \"clang\"
rustflags = [\"-C\", \"link-arg=-fuse-ld=/path/to/mold\"]
"