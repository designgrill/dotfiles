#!/usr/bin/env bash

# System Level Updates
# Install all available updates
# sudo softwareupdate -ia --verbose
# Install only recommended available updates
sudo softwareupdate -ir --verbose

ARCH=$(uname -m)
if [[ $ARCH == 'arm64' ]]; then
  # Install Rosetta as some software need it
  sudo softwareupdate --install-rosetta
fi;

