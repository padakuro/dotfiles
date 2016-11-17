#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_directory "${DOTFILES_HOME}/.vim/.cache"
ensure_directory "${DOTFILES_HOME}/.vim/.cache/undo"
