#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_arch_package "git"
ensure_arch_package "git-lfs"
install_directory "${DOTFILES_SELF_ROOT}/.zsh"
install_directory "${DOTFILES_SELF_ROOT}/.config"
