# Show the full pathnames
set -U fish_prompt_pwd_dir_length 0
set -Ux EDITOR "atom --wait"

# Set the nvm working directory
set -Ux  NVM_DIR "$HOME/.nvm"

if test -d ~/.local/fish
  for f in ~/.local/fish/*.fish
    source $f
  end
end

# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
