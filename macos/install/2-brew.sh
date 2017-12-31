#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade

brewapps=(
  "ag" # Silver Searcher
  "bash-completion2"
  "bash" # Install Bash 4, don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
  "brew-cask-completion"
  "coreutils" # Install GNU core utilities (those that come with macOS are outdated), Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  "csshx"
  "ffmpeg --with-openssl --with-libvpx"
  "findutils" # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  "fish"
  "git-extras"
  "git-lfs"
  "git"
  "gnu-sed --with-default-names" # Install GNU `sed`, overwriting the built-in `sed`.
  "gnupg"
  "go"
  "grep --with-default-names" # Install more recent versions of some macOS tools.
  "httpie"
  "hub" # github util. gotta love `hub fork`, `hub create`, `hub checkout <PRurl>`
  "imagemagick --with-webp"
  "lua"
  "mas"
  "moreutils" # Install some other useful utilities like `sponge`.
  "mysql"
  "node"
  "ntfs-3g"
  "openssh" # Install more recent versions of some macOS tools.
  "pandoc"
  "qcachegrind"
  "qpdf"
  "redis"
  "screen" # Install more recent versions of some macOS tools.
  "ssh-copy-id"
  "sshfs"
  "stow"
  "tldr"
  "tree"
  "unrar"
  "vim --with-override-system-vi" # Install more recent versions of some macOS tools.
  "wget --with-iri"
  "yarn"
  "youtube-dl"
  "zopfli"
)

brewappsinstall=()
brewappsupgrade=()

for pkg in "${brewapps[@]}"; do
    if brew list -1 | grep -q "^${pkg}\$"; then
        brewappsupgrade+=("$pkg")
    else
        brewappsinstall+=("$pkg")
    fi
done

echo "🤖 installing ${brewappsinstall[@]}"
for pkg in "${brewappsinstall[@]}"; do
  brew install ${pkg}
done

echo "🤖 upgrading ${brewappsupgrade[@]}"
for pkg in "${brewappsupgrade[@]}"; do
  brew upgrade ${pkg}
done

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
fi;

brew cleanup
