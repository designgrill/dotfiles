# Show the full pathnames
set -U fish_prompt_pwd_dir_length 0
set -Ux EDITOR "code --wait"
set -U arch (uname -m)

if test "$arch" = 'arm64'
  /opt/homebrew/bin/brew shellenv | source;
end

if test -d ~/.local/fish
  for f in ~/.local/fish/*.fish
    source $f
  end
end

# Install fisher
# Note: the old https://git.io/fisher short link is deprecated; use the canonical URL.
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set up Android Commandling
if test -d ~/Library/Android
  set --export ANDROID ~/Library/Android;
  set --export ANDROID_HOME $ANDROID/sdk;
  set -gx PATH $ANDROID_HOME/tools $PATH;
  set -gx PATH $ANDROID_HOME/tools/bin $PATH;
  set -gx PATH $ANDROID_HOME/platform-tools $PATH;
  set -gx PATH $ANDROID_HOME/emulator $PATH
end


# Golang
mkdir -p ~/Documents/go
set --export GOPATH ~/Documents/go;
set -gx PATH $GOPATH/bin $PATH;

# GOROOT-based install location to your PATH:
set -gx PATH (brew --prefix)/opt/go/libexec/bin $PATH;

# Core Utils
set -gx PATH (brew --prefix)/opt/coreutils/libexec/gnubin $PATH;
set -gx MANPATH (brew --prefix)/opt/coreutils/libexec/gnuman $MANPATH;

# Find Utils
set -gx PATH (brew --prefix)/opt/findutils/libexec/gnubin $PATH;

# sed
set -gx PATH (brew --prefix)/opt/gnu-sed/libexec/gnubin $PATH;

# grep
set -gx PATH (brew --prefix)/opt/grep/libexec/gnubin $PATH;


# Source files related to Google Cloud if exists
set -l gcloud_inc (brew --prefix)/Caskroom/gcloud-cli/latest/google-cloud-sdk/path.fish.inc
test -f $gcloud_inc; and source $gcloud_inc

# Set up the nvm
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -Ux  NVM_DIR "$HOME/.nvm"
# Uncomment the following line if you are using node frequently
# nvm use default --silent

# Set up uv
uv generate-shell-completion fish | source
uvx --generate-shell-completion fish | source

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)

# Set up rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# Source the broot helper function
if test -d ~/Library/Preferences/org.dystroy.broot/launcher/fish/br
  source ~/Library/Preferences/org.dystroy.broot/launcher/fish/br
end

# aliases
alias g='git'

# ls colors
if test -f ~/.dircolors
    eval (dircolors -c ~/.dircolors)
end

# terminal colors changes
set fish_color_option brcyan
set fish_color_command blue
set fish_color_autosuggestion black