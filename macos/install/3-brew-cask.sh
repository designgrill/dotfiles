#!/usr/bin/env bash

# Get the remaining ones from Homebrew Cask
brew tap homebrew/cask-versions
# Let's get some fonts as well
brew tap homebrew/cask-fonts


brewcaskapps=(
  adobe-acrobat-reader
  affinity
  alt-tab
  android-platform-tools
  android-studio
  antigravity
  antigravity-cli
  antigravity-ide
  anydesk
  anythingllm
  charles
  chatgpt
  cheatsheet
  claude
  claude-code
  codex
  cursor
  cyberduck
  diffmerge
  dropbox
  fanny
  firefox
  flux
  font-victor-mono
  gcloud-cli
  google-chrome
  google-cloud-sdk
  google-drive
  imagealpha
  imageoptim
  itsycal
  jetbrains-toolbox
  kiro
  logi-options+
  macfuse
  microsoft-teams
  mounty
  openemu
  openjdk
  plex
  plex-media-server
  postico
  postman
  rectangle
  sourcetree
  teamviewer
  vagrant
  visual-studio-code
  vlc
  vnc-viewer
  wireshark-app
  xbar
  xquartz
  zed
  zoom
)

brewcaskapps+=(
  inkscape # dependent on xquartz
)

brewcaskappsinstall=()
brewcaskappsupgrade=()

for pkg in "${brewcaskapps[@]}"; do
  if (brew outdated --casks --greedy --quiet | grep -q "^${pkg%% *}\$"); then
    brewcaskappsupgrade+=("$pkg")
  elif ! (brew list --casks -1 | grep -q "^${pkg%% *}\$"); then
    brewcaskappsinstall+=("$pkg")
  fi
done

if [ ${#brewcaskappsinstall[@]} -eq 0 ]; then
    echo "⛳️ Nothing new to install"
else
  echo "⛳️ installing ${brewcaskappsinstall[*]}"
  for pkg in "${brewcaskappsinstall[@]}"; do
    brew install --casks --appdir="/Applications" "${pkg}"
  done
fi


if [ ${#brewcaskappsupgrade[@]} -eq 0 ]; then
    echo "⛳️ Nothing to upgrade"
else
  echo "⛳️ ugrading ${brewcaskappsupgrade[*]}"
  for pkg in "${brewcaskappsupgrade[@]}"; do
    brew upgrade --casks --appdir="/Applications" "${pkg}"
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
