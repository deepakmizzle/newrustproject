sudo apt update
sudo apt install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup install stable
rustup install nightly
sudo apt-get install build-essential libssl-dev pkg-config libclang-dev llvm
cargo install bpf-linker
cargo xtask build-ebpf
llvm-objdump -S target/bpfel-unknown-none/debug/netguard
#cargo xtask run -- -h
RUST_LOG=info cargo xtask run -- --iface wlp58s0
# After stoppping using Ctrl+C checking the program get detached
#sudo bpftool prog list
#run the binary
#sudo -E target/debug/netguard --iface wlp58s0
