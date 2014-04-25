rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Color\ Scheme\ -\ Default/Solarized\ \(*\).tmTheme.cache
curl -L "https://github.com/altercation/solarized/raw/master/textmate-colors-solarized/Solarized%20(dark).tmTheme" -o ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Color\ Scheme\ -\ Default/Solarized\ \(Dark\).tmTheme
curl -L "https://github.com/altercation/solarized/raw/master/textmate-colors-solarized/Solarized%20(light).tmTheme" -o ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Color\ Scheme\ -\ Default/Solarized\ \(Light\).tmTheme
mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settingsOLD
ln -s ~/Documents/desktop-settings/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /bin/subl
