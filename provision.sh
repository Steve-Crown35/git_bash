#!/bin/bash

# Update system
sudo apt-get update
sudo apt-get upgrade -y

# Install basic tools
sudo apt-get install -y \
    curl \
    wget \
    git \
    vim \
    htop \
    net-tools

# Configure timezone
sudo timedatectl set-timezone UTC

# Add any additional configuration here
