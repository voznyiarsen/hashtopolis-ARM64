#!/bin/bash

# Script to set up Docker Buildx for ARM64 builds on an ARM64 system
# Wipes and resets the environment if already present

#set -e  # Exit on error

# Function to wipe existing Docker Buildx environment
wipe_buildx_environment() {
    echo "Wiping existing Docker Buildx environment..."
    docker buildx prune -af  # Remove all Buildx cache
    docker buildx rm $(docker buildx ls -q) 2>/dev/null || true  # Remove all builders
    echo "Docker Buildx environment wiped."
}

# Function to set up Docker Buildx for ARM64
setup_buildx_environment() {
    echo "Setting up Docker Buildx for ARM64..."

    # Create a new Buildx builder
    echo "Creating a new Docker Buildx builder..."
    docker buildx create --name arm64-builder --use

    # Bootstrap the builder
    echo "Bootstrapping the builder..."
    docker buildx inspect --bootstrap

    echo "Docker Buildx environment setup complete."
}

# Main script
echo "Starting Docker Buildx setup for ARM64..."

# Wipe existing environment if present
wipe_buildx_environment

# Set up the new environment
setup_buildx_environment

# Verify the setup
echo "Verifying the setup..."
docker buildx ls

echo "Setup complete. You can now build ARM64 images on this system using Docker Buildx."
