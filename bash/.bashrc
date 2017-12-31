# Lets figure out the OS for any OS specific stuff
OS=$(uname -s)

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Use atom as default editor
export EDITOR='atom'

#Path setup
if [[ $OS == 'Darwin' ]]; then
  # Golang
  mkdir -p ~/Documents/go
  export GOPATH=~/Documents/go

  # Android
  export ANDROID_SDK_ROOT="$(brew --prefix)/android-sdk"
elif [[ $OS == 'Linux' ]]; then
  # Golang
  mkdir -p ~/documents/go
  export GOPATH=~/documents/go

  # Android
  # @todo
fi

export PATH=$PATH:$GOPATH/bin

# Make the Bash History size unlimited
export HISTSIZE=
export HISTFILESIZE=

# Get Bash Completion which gives auto completion for 100s of commands including git

if [[ $OS == 'Darwin' ]] && which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Source other interesting files
source ~/.bash/prompt.sh
source ~/.bash/aliases.sh
source ~/.bash/functions.sh
