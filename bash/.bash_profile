# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Use Sublime Text as default editor
export EDITOR='subl -w'

# MySQL directories 
export PATH=$PATH:/usr/local/mysql/bin

alias serve='python -m SimpleHTTPServer'
alias socks='ssh -fND 8888'
alias reload='source ~/.bash_profile'
alias ip="ifconfig -a | perl -nle'/((\d+\.){3}\d+)/ && print \$1'"
alias eip="curl -s http://ipecho.net/plain | awk '{print $1}'"