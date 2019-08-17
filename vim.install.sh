#!/usr/bin/env bash

# This has to be run in the project root only

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Doesn't take care of OS specific installations.
# Go in respective folder to do that
#
# IMPORTANT: TRY TO KEEP THIS SAME FILE GOOD FOR UPDATES AS WELL.
# UPDATE THIS COMMENT WHEN THIS IS NOT THE CASE ANYMORE.

# Vim Settings
mkdir -p "$DIR/vim/.vim/autoload"
curl -LSso "$DIR/vim/.vim/autoload/pathogen.vim" https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
if [ -d "$DIR/vim/.vim/bundle/vim-colors-solarized" ]; then
  git -C "$DIR/vim/.vim/bundle/vim-colors-solarized" pull
else
  git clone git://github.com/altercation/vim-colors-solarized.git "$DIR/vim/.vim/bundle/vim-colors-solarized"
fi
