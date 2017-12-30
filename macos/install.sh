#!/usr/bin/env bash
mkdir -p ~/Documents/go

xcode-select --install

brew update
brew upgrade --all

brew install csshx
brew install ffmpeg --with-openssl
brew install go
brew install fish
brew install mas
brew install qpdf
brew install tldr
brew install youtube-dl
brew install stow
brew install ssh-copy-id
brew install sshfs
brew install qcachegrind
brew install ntfs-3g
brew install ag # Silver Searcher
brew install yarn

# Get the following apps from App Store
mas install 417602904 # CloudApp 417602904
mas install 409222199 # Cyberduck 409222199
mas install 406056744 # Evernote 406056744
mas install 405399194 # Kindle 405399194
mas install 880663569 # Pixlr 880663569
mas install 1031280567 # Postico 1031280567
mas install 425955336 # Skitch 425955336
mas install 803453959 # Slack 803453959
mas install 1106867065 # Svgsus 1106867065
mas install 425424353 # The Unarchiver 425424353
mas install 485812721 # TweetDeck 485812721
mas install 409789998 # Twitter 409789998
mas install 1147396723 # WhatsApp 1147396723
mas install 410628904 # Wunderlist 410628904
mas install 497799835 # Xcode 497799835

# Get the remaining ones from Homebrew Cask
brew cask install adium
brew cask install android-studio
brew cask install atom
brew cask install google-chrome
brew cask install cheatsheet
# brew cask install cloudapp
# brew cask install cyberduck
brew cask install diffmerge
brew cask install dnscrypt
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install imagealpha
brew cask install imageoptim
brew cask install inkscape
brew cask install itsycal
# brew cask install kindle
brew cask install marp
brew cask install metabase-app
brew cask install mysqlworkbench
brew cask install openemu
# brew cask install postico
brew cask install postman
brew cask install skype
brew cask install spectacle
brew cask install sourcetree
brew cask install teamviewer
# brew cask install the-unarchiver
brew cask install tunnelblick
brew cask install unrarx
brew cask install videostream
brew cask install virtualbox
brew cask install vlc
brew cask install visual-studio-code
# brew cask install whatsapp
