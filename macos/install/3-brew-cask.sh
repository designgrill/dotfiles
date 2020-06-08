#!/usr/bin/env bash

# Get the remaining ones from Homebrew Cask
brew tap homebrew/cask-versions

brewcaskapps=(
  adobe-acrobat-reader
  android-studio
  atom
  bitbar
  charles
  cheatsheet
  cyberduck
  diffmerge
  docker
  dropbox
  fanny
  firefox
  flux
  google-backup-and-sync
  google-chrome
  google-cloud-sdk
  google-drive-file-stream
  imagealpha
  imageoptim
  itsycal
  java
  jetbrains-toolbox
  metabase
  mysqlworkbench
  openemu
  osxfuse
  plex
  plex-media-server
  postico
  postman
  skype
  sourcetree
  spectacle
  teamviewer
  transmission
  virtualbox
  visual-studio-code
  vlc
  wireshark
  xquartz
  zoomus
  zotero
)

brewcaskapps+=(
  inkscape # dependent on xquartz
)

brewcaskappsinstall=()
brewcaskappsupgrade=()

for pkg in "${brewcaskapps[@]}"; do
  if (brew cask outdated --greedy --quiet | grep -q "^${pkg%% *}\$"); then
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
pip3 install python-language-server --user

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
