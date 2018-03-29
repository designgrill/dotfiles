unlockpdf() {
  qpdf --decrypt --password=$2 $1 Unlocked-$1
}

rotatepdf() {
  qpdf "$1" --rotate=$2:1-z "Rotated-$1"
}

showcerts() {
  echo | openssl s_client -showcerts -servername $1 -connect $1:${2:-"443"} 2>/dev/null
}

compresspdf() {
    gs -sDEVICE=pdfwrite -dQUIET -dDetectDuplicateImages -dCompressFonts=true -dEmbedAllFonts=true -dGrayImageResolution=72 -dColorImageResolution=72 -dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray  -dPDFSETTINGS=/${2:-"screen"} -dCompatibilityLevel=1.4 -o "Compressed-$1" "$1"
}

youtubeslice() {
  # 1 - youtubeURL
  # 2 - starttime
  # 3 - duration
  # 4 - filename
  # 5 - format [18,22]
  ffmpeg -ss $2 -i $(youtube-dl -f $5 --get-url $1) -t $3 -c:v copy -c:a copy $4.mp4
}
