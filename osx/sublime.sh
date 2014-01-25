rm ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Default/Solarized\ \(*\).tmTheme.cache
curl -L "https://github.com/altercation/solarized/raw/master/textmate-colors-solarized/Solarized%20(dark).tmTheme" -o ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Default/Solarized\ \(Dark\).tmTheme
curl -L "https://github.com/altercation/solarized/raw/master/textmate-colors-solarized/Solarized%20(light).tmTheme" -o ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Color\ Scheme\ -\ Default/Solarized\ \(Light\).tmTheme
mv ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settingsOLD
ln -s ~/Dropbox/Settings/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings

sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /bin/subl
