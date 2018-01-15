# Lets figure out the OS for any OS specific stuff
OS=$(uname -s)

# Use atom as default editor
export EDITOR='atom --wait'

#Path setup
if [[ $OS == 'Darwin' ]]; then
  # Golang
  mkdir -p ~/Documents/go
  export GOPATH=~/Documents/go
  # GOROOT-based install location to your PATH:
  export PATH="$PATH:$(brew --prefix)/opt/go/libexec/bin"

  # Android
  export ANDROID_SDK_ROOT="$(brew --prefix)/share/android-sdk"

  # Core Utils
  export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"

elif [[ $OS == 'Linux' ]]; then
  # Golang
  mkdir -p ~/documents/go
  export GOPATH=~/documents/go

  # Android
  # @todo
fi

export PATH=$PATH:$GOPATH/bin

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# Make the Bash History size unlimited
export HISTSIZE=
export HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
# Get good colors for common commands
eval "$(dircolors ~/.dircolors)" # https://github.com/seebi/dircolors-solarized/blob/master/dircolors.256dark
