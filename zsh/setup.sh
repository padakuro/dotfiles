#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_directory "${DOTFILES_HOME}/.zsh/plugins"
install_directory "${DOTFILES_SELF_ROOT}/.zsh"
install_files \
  "${DOTFILES_SELF_ROOT}/.zprofile" \
  "${DOTFILES_SELF_ROOT}/.zshenv" \
  "${DOTFILES_SELF_ROOT}/.zshrc"

install_git "${DOTFILES_HOME}/.zsh/zinit" "https://github.com/zdharma/zinit.git" "efff1767794a75624d063f1359e4dcb6e17d0b87"
