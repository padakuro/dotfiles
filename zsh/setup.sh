#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_directory "${DOTFILES_HOME}/.zsh/plugins"
install_directory "${DOTFILES_SELF_ROOT}/.zsh"
install_files \
  "${DOTFILES_SELF_ROOT}/.zprofile" \
  "${DOTFILES_SELF_ROOT}/.zshenv" \
  "${DOTFILES_SELF_ROOT}/.zshrc"

install_git "${DOTFILES_HOME}/.zsh/zplug" "https://github.com/zplug/zplug.git" "335536a8e15b4ada24047b4c32aa456af01a3a0c"
