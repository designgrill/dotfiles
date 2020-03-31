#!/usr/bin/env bash

# ffmpeg
if brew list -1 | grep -q "ffmpeg"; then
    brew upgrade "ffmpeg"
else
    brew install "ffmpeg"
fi

# Xcode
mas install 497799835 # Xcode 497799835
echo "⛳️ Checking if you need to accept Xcode license. Password will be asked to accept."
# sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch
