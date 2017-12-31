#!/usr/bin/env bash

# Get the remaining ones from Homebrew Cask
brew tap caskroom/cask

brewcaskapps=(
  adium
  android-platform-tools
  android-sdk
  android-studio
  atom
  cheatsheet
  cyberduck
  diffmerge
  dnscrypt
  docker
  dropbox
  firefox
  flux
  google-chrome
  imagealpha
  imageoptim
  inkscape
  itsycal
  java
  marp
  metabase-app
  mysqlworkbench
  openemu
  postico
  postman
  skype
  sourcetree
  spectacle
  teamviewer
  transmission
  tunnelblick
  videostream
  virtualbox
  visual-studio-code
  vlc
  xquartz
)

brewcaskappsinstall=()
brewcaskappsupgrade=()

for pkg in "${brewcaskapps[@]}"; do
    if brew cask list -1 | grep -q "^${pkg}\$"; then
        brewcaskappsupgrade+=("$pkg")
    else
        brewcaskappsinstall+=("$pkg")
    fi
done

echo "🤖 installing ${brewcaskappsinstall[@]}"
for pkg in "${brewcaskappsinstall[@]}"; do
  brew cask install --appdir="/Applications" ${pkg}
done

echo "🤖 ugrading ${brewcaskappsupgrade[@]}"
for pkg in "${brewcaskappsupgrade[@]}"; do
  brew cask upgrade --appdir="/Applications" ${pkg}
done

brew cleanup
