# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Use Sublime Text as default editor
export EDITOR='subl -w'

#Go Path setup
export GOPATH=~/Documents/go
export PATH=$PATH:$GOPATH/bin

# MySQL directories 
export PATH=$PATH:/usr/local/mysql/bin

#Android SDK
export ANDROID_HOME=~/sdk/
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

alias serve='python -m SimpleHTTPServer'
alias socks='ssh -fND 8888'
alias reload='source ~/.bash_profile'
alias ip="ifconfig -a | perl -nle'/((\d+\.){3}\d+)/ && print \$1'"
alias eip="curl -s http://ipecho.net/plain | awk '{print $1}'"
alias sourcetree="open -a SourceTree"
alias large="find ./ -type f -size +5M -print0 | xargs -0 ls -halt | sort -rn -k5"

source ~/git-completion.bash

if [ -f ~/bash_completion/bash_completion ]; then
   source ~/bash_completion/bash_completion
fi

source ~/.bash_prompt
