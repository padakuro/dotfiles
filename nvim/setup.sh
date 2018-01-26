#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_directory "${DOTFILES_HOME}/.cache/nvim"
ensure_directory "${DOTFILES_HOME}/.cache/nvim/undo"
ensure_directory "${DOTFILES_HOME}/.nvim/bundles"
ensure_directory "${DOTFILES_HOME}/.config/nvim"
ln -s "${DOTFILES_SELF_ROOT}/.config/nvim/init.vim" "${DOTFILES_HOME}/.config/nvim/init.vim"
ln -s "${DOTFILES_SELF_ROOT}/.nvim/bundles/dein.vim" "${DOTFILES_HOME}/.nvim/bundles/dein.vim"
