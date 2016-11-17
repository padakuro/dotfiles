#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

if [ "${WORKON_HOME}" = "" ]; then
  log_error "python: WORKON_HOME not set"
  exit 1
fi

ensure_directory "${WORKON_HOME}"
ensure_arch_package "python-virtualenvwrapper"

symlink_recursive "${DOTFILES_SELF_ROOT}"
