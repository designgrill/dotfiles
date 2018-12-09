#!/usr/bin/env bash

# Get the remaining ones from Homebrew Cask
brew tap caskroom/cask
brew tap caskroom/versions

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
  google-cloud-sdk
  imagealpha
  imageoptim
  istat-menus
  itsycal
  java
  java8
  jetbrains-toolbox
  kobo
  marp
  metabase-app
  mysqlworkbench
  openemu
  osxfuse
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
  wireshark
  xquartz
)

brewcaskapps+=(
  inkscape # dependent on xquartz
)

brewcaskappsinstall=()
brewcaskappsupgrade=()

for pkg in "${brewcaskapps[@]}"; do
  if (brew cask outdated --quiet | grep -q "^${pkg%% *}\$"); then
    brewcaskappsupgrade+=("$pkg")
  elif ! (brew cask list -1 | grep -q "^${pkg%% *}\$"); then
    brewcaskappsinstall+=("$pkg")
  fi
done

if [ ${#brewcaskappsinstall[@]} -eq 0 ]; then
    echo "⛳️ Nothing new to install"
else
  echo "⛳️ installing ${brewcaskappsinstall[*]}"
  for pkg in "${brewcaskappsinstall[@]}"; do
    brew cask install --appdir="/Applications" "${pkg}"
  done
fi


if [ ${#brewcaskappsupgrade[@]} -eq 0 ]; then
    echo "⛳️ Nothing to upgrade"
else
  echo "⛳️ ugrading ${brewcaskappsupgrade[*]}"
  for pkg in "${brewcaskappsupgrade[@]}"; do
    brew cask upgrade --appdir="/Applications" "${pkg}"
  done
fi

echo "⛳️ installing Python Language Server for code editor like Atom"
pip3 install python-language-server

echo "⛳️ installing Google App Engine Python support"
if which brew > /dev/null && [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
fi;
if which brew > /dev/null && [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
fi;
gcloud components install app-engine-python
gcloud components install app-engine-python-extras

brew cleanup
