#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

PLUGINS="${DOTFILES_HOME}/.zsh/plugins"

case "$1" in
  *)
    symlink_files "${DOTFILES_SELF_ROOT}"
    symlink_files "${DOTFILES_SELF_ROOT}/.zsh" "${DOTFILES_SELF_ROOT}"
    symlink_directory "${DOTFILES_SELF_ROOT}/.zsh/zplug" "${DOTFILES_SELF_ROOT}"
    symlink_directory "${DOTFILES_SELF_ROOT}/.zsh/base16-shell" "${DOTFILES_SELF_ROOT}"

    ensure_directory "${PLUGINS}"
  ;;
esac
