#!/bin/sh

# Add flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# Install flatseal for managing flatpak permissions
flatpak install flathub com.github.tchx84.Flatseal

##### How to update system #####
# Update flake.lock
nix flake update

# Apply the updates
sudo nixos-rebuild switch --flake .
# Occasionally, you may encounter a "sha256 mismatch" error when running nixos-rebuild switch.
# This error can be resolved by updating flake.lock using nix flake update.
