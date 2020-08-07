#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_arch_package "neovim"

ensure_directory "${DOTFILES_HOME}/.cache/nvim"
ensure_directory "${DOTFILES_HOME}/.cache/nvim/undo"
ensure_directory "${DOTFILES_HOME}/.nvim/bundles"
ensure_directory "${DOTFILES_HOME}/.config/nvim"

install_directory "${DOTFILES_SELF_ROOT}/.config"
install_directory "${DOTFILES_SELF_ROOT}/.zsh"

install_git "${DOTFILES_HOME}/.nvim/bundles/dein.vim" "https://github.com/Shougo/dein.vim.git" "108cd6e749099ec75d9763d1384ab4d90999459e"
