# Use the official Rust image as the base image
FROM rust:latest

# Install Rust nightly
RUN rustup install stable
RUN rustup toolchain install nightly --component rust-src
#install bpf-linker
RUN cargo install bpf-linker

#install the linux tools
# RUN sudo apt install linux-tools-5.8.0-63-generic
# RUN export PATH=/usr/lib/linux-tools/5.8.0-63-generic:$PATH

# Create a new directory for the application
WORKDIR /usr/src/app
 
# Copy the Cargo.toml and Cargo.lock files
COPY . ./
 
# Install dependencies
RUN cargo fetch
 
# Copy the source code
COPY . .
 
# Build the application in release mode
RUN cargo xtask build-ebpf
RUN cargo build --release
 
# Set the startup command to run your application
CMD ["./target/release/netguard"]
 
# Expose port 8000 to the outside world
EXPOSE 8000

# # Run the application
# ENTRYPOINT ["netguard"]
