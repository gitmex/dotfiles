#/bin/bash

export DOTFILES_DIR DOTFILES_BACKUP
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_BACKUP=$DOTFILES_DIR/BACKUP

logger DOTFILES running from $DOTFILES_DIR

ln -sfv "$DOTFILES_DIR/env/.inputrc" ~ && logger DOTFILES symlinked .inputrc
ln -sfv "$DOTFILES_DIR/env/.joerc" ~ && logger DOTFILES symlinked .joerc

