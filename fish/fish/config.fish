# Show the full pathnames
set -U fish_prompt_pwd_dir_length 0
set -Ux EDITOR "atom --wait"

if test -d ~/.local/fish
    source ~/.local/fish/*.fish
end
