#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

source "${DOTFILES_SELF_ROOT}/.zsh/nodejs.zshenv"

npmRc="${DOTFILES_HOME}/.npmrc"
touch "${npmRc}"

grep "^prefix" "${npmRc}" > /dev/null
if [ $? -ne 0 ]; then
  echo "prefix = ${NPM_PACKAGES}" >> "${npmRc}"
  log_info ".npmrc updated"
fi

install_directory "${DOTFILES_SELF_ROOT}/.zsh"
