#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

case "$1" in
  save)
    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > ${DOTFILES_SELF_ROOT}/media-keys.conf
    dconf dump /org/gnome/shell/ > ${DOTFILES_SELF_ROOT}/shell.conf
    dconf dump /org/gnome/desktop/ > ${DOTFILES_SELF_ROOT}/desktop.conf
    dconf dump /org/gnome/terminal/legacy/ > ${DOTFILES_SELF_ROOT}/terminal.conf
  ;;

  *)
    dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ${DOTFILES_SELF_ROOT}/media-keys.conf
    dconf load /org/gnome/shell/ < ${DOTFILES_SELF_ROOT}/shell.conf
    dconf load /org/gnome/desktop/ < ${DOTFILES_SELF_ROOT}/desktop.conf
    dconf load /org/gnome/terminal/legacy/ < ${DOTFILES_SELF_ROOT}/terminal.conf

    install_directory "${DOTFILES_SELF_ROOT}/.config"
  ;;
esac
