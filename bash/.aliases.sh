alias serve='python -m SimpleHTTPServer'
alias socks='ssh -fND 8888'
alias reload='source ~/.bash_profile'
alias ip="ifconfig -a | perl -nle'/((\d+\.){3}\d+)/ && print \$1'"
alias eip="curl -s http://ipecho.net/plain | awk '{print $1}'"
alias sourcetree="open -a SourceTree"
alias large="find ./ -type f -size +5M -print0 | xargs -0 ls -halt | sort -rn -k5"
