#!/usr/bin/env bash

brewapps=(
  "ntfs-3g"
  "sshfs"
)

brewappsinstall=()
brewappsupgrade=()

for pkg in "${brewapps[@]}"; do
    if brew list -1 | grep -q "^${pkg}\$"; then
        brewappsupgrade+=("$pkg")
    else
        brewappsinstall+=("$pkg")
    fi
done

echo "🤖 installing ${brewappsinstall[@]}"
for pkg in "${brewappsinstall[@]}"; do
  brew install ${pkg}
done

echo "🤖 upgrading ${brewappsupgrade[@]}"
for pkg in "${brewappsupgrade[@]}"; do
  brew upgrade ${pkg}
done

brewcaskapps=(
  inkscape
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
