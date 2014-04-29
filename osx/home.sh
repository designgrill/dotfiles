#mv ~/.ssh ~/.sshOLD
ln -s ~/Dropbox/Settings/.ssh ~/.ssh
chmod -R og-rxw ~/.ssh
mv ~/.bash_profile ~/.bash_profileOLD
mv ~/.bash_history ~/.bash_historyOLD
ln -s ~/Documents/desktop-settings/bash/.bash_profile ~/.bash_profile
ln -s ~/Dropbox/Settings/mygola-meenal/.bash_history ~/.bash_history


mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
mv ~/.vimrc ~/.vimrcOLD
ln -s ~/Documents/desktop-settings/vim/.vimrc ~/.vimrc
#mv ~/.subversion ~/.subversionOLD
#ln -s ~/Dropbox/Settings/.subversion ~/.subversion

curl -Sso ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

curl -0 http://www.caliban.org/files/bash/bash-completion-20060301.tar.gz | tar -zx
mv bash_completion ~/ 
