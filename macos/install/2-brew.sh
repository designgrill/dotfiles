#!/usr/bin/env bash

# Check for Homebrew,
# Install if we don't have it
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update

brewapps=(
  # update the shell files to ensure the gnu version of some packages are available
  # check out https://github.com/fabiomaia/linuxify/blob/master/.linuxify
  "automake"
  "aws-google-auth"
  "aws-shell"
  "awscli"
  "bash-completion@2"
  "bash" # Install Bash 4, don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
  "brew-cask-completion"
  "broot"
  "coreutils" # Install GNU core utilities (those that come with macOS are outdated), Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
  "csshx"
  "dnscrypt-proxy"
  "findutils" # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
  "fish"
  "ghostscript" # gs
  "git-extras"
  "git-lfs"
  "git"
  "glances"
  "gnu-sed" # Install GNU `sed`, overwriting the built-in `sed`.
  "gnupg"
  "go"
  "grep" # Install more recent versions of some macOS tools.
  "httpie"
  "hub" # github util. gotta love `hub fork`, `hub create`, `hub checkout <PRurl>`
  "jq" # for json manipulation in commandline
  "lua"
  "mas"
  "moreutils" # Install some other useful utilities like `sponge`.
  "mycli"
  "mysql"
  "node"
  "nvm"
  "openssh" # Install more recent versions of some macOS tools.
  "pandoc"
  "proselint"
  "pyenv"
  "qcachegrind"
  "qpdf"
  "rbenv"
  "redis"
  "rustup-init"
  "screen" # Install more recent versions of some macOS tools.
  "shellcheck"
  "ssh-copy-id"
  "stow"
  "telnet"
  "terraform"
  "tcptraceroute"
  "the_silver_searcher" # ag — Silver Searcher
  "tldr"
  "tree"
  "unrar"
  "vim" # Install more recent versions of some macOS tools.
  "wget"
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

# Add google and cloudflare as the default DNS providers
grep -q '^server_names' /usr/local/etc/dnscrypt-proxy.toml && sed -i '' 's/^server_names.*/server_names = ["google", "cloudflare"]/' /usr/local/etc/dnscrypt-proxy.toml || sed -i '' '/^# server_names.*/a\'$'\n''server_names = ["google", "cloudflare"]' /usr/local/etc/dnscrypt-proxy.toml
sudo brew services start dnscrypt-proxy

# Set the directory to keep binaries for nvm
mkdir -p ~/.nvm

# Set up rust
rustup-init -y
rustup completions bash > "$(brew --prefix)/etc/bash_completion.d/rustup.bash-completion"
# fish comes with basic ruustup completion by default
