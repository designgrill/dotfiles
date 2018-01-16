#!/usr/bin/env bash

# ffmpeg
if brew list -1 | grep -q "ffmpeg"; then
    brew upgrade "ffmpeg --with-openssl --with-libvpx"
else
    brew install "ffmpeg --with-openssl --with-libvpx"
fi


# imagemagick
if brew list -1 | grep -q "imagemagick"; then
    brew upgrade "imagemagick --with-webp"
else
    brew install "imagemagick --with-webp"
fi

# Xcode
mas install 497799835 # Xcode 497799835
echo "⛳️ Checking if you need to accept Xcode license. Password will be asked to accept."
# sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch
