#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

touch "${DOTFILES_HOME}/.npmrc"
npm_prefix=$(grep "^prefix" "${DOTFILES_HOME}/.npmrc")

if [ ! $? -eq 0 ]; then
  echo "prefix = ${NPM_PACKAGES}" >> ~/.npmrc
  log_info ".npmrc updated"
fi

symlink_recursive "${DOTFILES_SELF_ROOT}"
