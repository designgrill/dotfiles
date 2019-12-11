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
