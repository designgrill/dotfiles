alias egrep="egrep --color=auto"
alias eip="curl -s http://ipecho.net/plain | awk '{print $1}'"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias ip="ifconfig -a | perl -nle'/((\d+\.){3}\d+)/ && print \$1'"
alias large="find ./ -type f -size +5M -print0 | xargs -0 ls -halt | sort -rn -k5"
alias ls="ls --color=auto"
alias reload='source ~/.bashrc'
alias serve='python -m SimpleHTTPServer'
alias socks='ssh -fND 8888'
alias gitg='open -a SourceTree "$(git rev-parse --show-toplevel)"'
alias groot='cd "$(git rev-parse --show-toplevel)"'
