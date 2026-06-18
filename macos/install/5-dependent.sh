#!/usr/bin/env bash

# These 2 brew packages depend on the macfuse cask (formerly osxfuse). On Apple
# Silicon, macFUSE needs its kernel extension approved in System Settings,
# followed by a reboot, before these will work.
brewapps=(
  "ntfs-3g"
  "sshfs"
)

brewappsinstall=()
brewappsupgrade=()

for pkg in "${brewapps[@]}"; do
  if (brew outdated --quiet | grep -q "^${pkg%% *}\$"); then
    brewappsupgrade+=("$pkg")
  elif ! (brew list -1 | grep -q "^${pkg%% *}\$"); then
    brewappsinstall+=("$pkg")
  fi
done

if [ ${#brewappsinstall[@]} -eq 0 ]; then
  echo "⛳️ Nothing new to install"
else
  echo "⛳️ installing ${brewappsinstall[*]}"
  for pkg in "${brewappsinstall[@]}"; do
    brew install "${pkg}"
  done
fi


if [ ${#brewappsupgrade[@]} -eq 0 ]; then
  echo "⛳️ Nothing to upgrade"
else
  echo "⛳️ upgrading ${brewappsupgrade[*]}"
  for pkg in "${brewappsupgrade[@]}"; do
    brew upgrade "${pkg}"
  done
fi


brew cleanup
