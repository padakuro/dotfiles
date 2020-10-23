#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

confPaths=(
  org/gnome/settings-daemon/plugins/media-keys

  org/gnome/mutter

  org/gnome/shell/keybindings
  org/gnome/shell/extensions/paperwm
  org/gnome/shell/extensions/dash-to-panel

  org/gnome/desktop/media-handling
  org/gnome/desktop/datetime
  org/gnome/desktop/calendar
  org/gnome/desktop/interface
  org/gnome/desktop/lockdown
  org/gnome/desktop/peripherals/touchpad
  org/gnome/desktop/input-sources
  org/gnome/desktop/wm/keybindings

  org/gnome/terminal/legacy
)

case "$1" in
  save)
    for cfg in "${confPaths[@]}"; do
      fileName="${cfg//\//-}.conf"
      dconf dump "/${cfg}/" > "${DOTFILES_SELF_ROOT}/${fileName}"
    done
  ;;

  install)
    for cfg in "${confPaths[@]}"; do
      fileName="${cfg//\//-}.conf"
      dconf load "/${cfg}/" < "${DOTFILES_SELF_ROOT}/${fileName}"
    done

    install_directory "${DOTFILES_SELF_ROOT}/.config"
    install_directory "${DOTFILES_SELF_ROOT}/.zsh"
  ;;
esac
