# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Use Sublime Text as default editor
export EDITOR='atom'

#Go Path setup
export GOPATH=~/Documents/go
export PATH=$PATH:$GOPATH/bin

# MySQL directories
export PATH=$PATH:/usr/local/mysql/bin

#Android SDK
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# Bash Hitory
export HISTFILE=~/Dropbox/Settings/.bash_history
# Make the size unlimited
export HISTSIZE=
export HISTFILESIZE=


source ~/git-completion.bash

if [ -f ~/bash_completion/bash_completion ]; then
   source ~/bash_completion/bash_completion
fi

source ~/.prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/anshul/.sdkman"
[[ -s "/Users/anshul/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/anshul/.sdkman/bin/sdkman-init.sh"
