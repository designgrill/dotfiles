# Lets figure out the OS for any OS specific stuff
OS=$(uname -s)
ARCH=$(uname -m)

# Use atom as default editor
export EDITOR='code --wait'

#Path setup
if [[ $OS == 'Darwin' ]]; then
  if [[ $ARCH == 'arm64' ]]; then
    # Set PATH, MANPATH, etc., for Homebrew.
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi;
  # Golang
  mkdir -p ~/Documents/go
  export GOPATH=~/Documents/go
  # GOROOT-based install location to your PATH:
  export PATH="$PATH:$(brew --prefix)/opt/go/libexec/bin"

  # Core Utils
  export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"

  # Android
  if [ -d ~/Library/Android ]; then
    export ANDROID=~/Library/Android;
    export ANDROID_HOME=$ANDROID/sdk;
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/emulator
  fi;

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

# confirm before executing commands from history
shopt -s histverify

# Get Bash Completion which gives auto completion for 100s of commands including git

if [[ $OS == 'Darwin' ]] && which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Source files related to Google Cloud if exists
if [[ $OS == 'Darwin' ]] && which brew > /dev/null && [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
fi;
if [[ $OS == 'Darwin' ]] && which brew > /dev/null && [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
fi;

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv
eval "$(rbenv init -)"

# rustup
export PATH="$HOME/.cargo/bin:$PATH"

# Source other interesting files
if [ -d ~/.bash/ ]; then
  for f in ~/.bash/*.sh;
    do source $f;
  done
fi;


# Source local additions if any
if [ -d ~/.local/bash ]; then
  for f in ~/.local/bash/*.sh;
    do source $f;
  done
fi;

# Get good colors for common commands
eval "$(dircolors ~/.dircolors)" # https://github.com/seebi/dircolors-solarized/blob/master/dircolors.256dark

# Source the broot helper function
if [ -d ~/Library/Preferences/org.dystroy.broot/launcher/bash/br ]; then
  source ~/Library/Preferences/org.dystroy.broot/launcher/bash/br;
fi;
