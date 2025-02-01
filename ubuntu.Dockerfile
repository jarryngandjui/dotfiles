# Use Ubuntu latest
FROM ubuntu:latest

# Set noninteractive mode to avoid prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Update and install some common packages (sudo, curl, wget, git, vim, build-essential, etc.)
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    vim \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set default command to bash
CMD ["/bin/bash"]
