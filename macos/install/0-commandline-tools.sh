#!/usr/bin/env bash

# Install Command Line Tools
if [ -d "$(xcode-select -p)" ]; then
  echo "xcode-select: already installed"
else
  xcode-select --install
fi
