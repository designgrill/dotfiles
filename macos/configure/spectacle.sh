#!/usr/bin/env bash

# Set up my preferred keyboard shortcuts
cp -r Spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

for app in "Spectacle"; do
	killall "${app}" &> /dev/null
done
