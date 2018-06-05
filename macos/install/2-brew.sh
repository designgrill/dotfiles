#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

brewapps=(
  "aws-shell"
  "bash-completion@2"
  "bash" # Install Bash 4, don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
  "brew-cask-completion"
  "coreutils" # Install GNU core utilities (those that come with macOS are outdated), Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  "csshx"
  "findutils --with-default-names" # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  "fish"
  "ghostscript" # gs
  "git-extras"
  "git-lfs"
  "git"
  "glances"
  "gnu-sed --with-default-names" # Install GNU `sed`, overwriting the built-in `sed`.
  "gnupg"
  "go"
  "grep --with-default-names" # Install more recent versions of some macOS tools.
  "httpie"
  "hub" # github util. gotta love `hub fork`, `hub create`, `hub checkout <PRurl>`
  "lua"
  "mas"
  "moreutils" # Install some other useful utilities like `sponge`.
  "mycli"
  "mysql"
  "node"
  "openssh" # Install more recent versions of some macOS tools.
  "pandoc"
  "proselint"
  "qcachegrind"
  "qpdf"
  "redis"
  "screen" # Install more recent versions of some macOS tools.
  "shellcheck"
  "ssh-copy-id"
  "stow"
  "terraform"
  "the_silver_searcher" # ag — Silver Searcher
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
  if (brew outdated --quiet | grep -q "^${pkg%% *}\$"); then
    brewappsupgrade+=("$pkg")
  elif ! (brew list -1 | grep -q "^${pkg%% *}\$"); then
    brewappsinstall+=("$pkg")
  fi
done

if [ ${#brewappsinstall[@]} -eq 0 ]; then
  echo "⛳️ Nothing new to install"
else
  echo "⛳️ installing ${brewappsinstall[*]}"
  for pkg in "${brewappsinstall[@]}"; do
    brew install "${pkg}"
  done
fi


if [ ${#brewappsupgrade[@]} -eq 0 ]; then
  echo "⛳️ Nothing to upgrade"
else
  echo "⛳️ upgrading ${brewappsupgrade[*]}"
  for pkg in "${brewappsupgrade[@]}"; do
    brew upgrade "${pkg}"
  done
fi


# Add brew-installed bash as one of the available shells
# To set it as default, `chsh -s /usr/local/bin/bash`
if ! grep -Fq '/usr/local/bin/bash' /etc/shells; then
  echo "⛳️ adding newly installed bash to the available shells. Passsword might be needed."
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
fi;

# Add brew-installed fish as one of the available shells
# To set it as default, `chsh -s /usr/local/bin/fish`
if ! grep -Fq '/usr/local/bin/fish' /etc/shells; then
  echo "⛳️ adding newly installed fish to the available shells. Passsword might be needed."
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells;
fi;

brew cleanup
