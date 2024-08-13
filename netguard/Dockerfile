# Use the official Rust image as a base
FROM rust:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    clang \
    libelf-dev \
    libbpfcc-dev \
    linux-headers-$(uname -r) \
    && rm -rf /var/lib/apt/lists/*

# Install bpf-linker
RUN cargo install bpf-linker

# Set the working directory
WORKDIR /app

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml Cargo.lock ./

# Build dependencies only
RUN cargo build --release

# Copy the source code
COPY . .

# Build the eBPF program
RUN cargo xtask build-ebpf --release

# Build the userspace application
RUN cargo build --release

# Command to run the userspace application
CMD ["cargo", "xtask", "run"]
