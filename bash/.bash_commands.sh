alias serve='python -m SimpleHTTPServer'
alias socks='ssh -fND 8888'
alias reload='source ~/.bash_profile'
alias ip="ifconfig -a | perl -nle'/((\d+\.){3}\d+)/ && print \$1'"
alias eip="curl -s http://ipecho.net/plain | awk '{print $1}'"
alias sourcetree="open -a SourceTree"
alias large="find ./ -type f -size +5M -print0 | xargs -0 ls -halt | sort -rn -k5"

unlockpdf() {
  qpdf --decrypt --password=$2 $1 Unlocked-$1
}

showcerts() {
  echo | openssl s_client -showcerts -servername $1 -connect $1:${2:-"443"} 2>/dev/null
}

compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -dEmbedAllFonts=true -dGrayImageResolution=72 -dColorImageResolution=72 -dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray  -dPDFSETTINGS=/${2:-"screen"} -dCompatibilityLevel=1.3 -sOutputFile=Compressed-$1 $1
}
