#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

_main() {
  cmd="$1"

  case "${cmd}" in
    install)
      local de="$2"

      #_install_common
      _install_uninstall_desktop_environment "install" "${de}"
    ;;
    uninstall)
      local de="$2"

      _install_uninstall_desktop_environment "uninstall" "${de}"
    ;;
    *)
      _install_self
    ;;
  esac
}

_install_self() {
  install_directory "${DOTFILES_SELF_ROOT}/.config"
  install_directory "${DOTFILES_SELF_ROOT}/.zsh"
}

_install_common() {
  local standardPackages=(
    tmux
    tree
    pv
    expect
    p7zip
    nftables
    powertop
    ntfs-3g
    wine-staging
    gimp
    neovim
    ghostscript
    ffmpeg
    sudo
  )
  local devPackages=(
    atom

    nodejs

    php
    php-apcu
    php-apcu-bc
    php-cgi
    php-embed
    php-gd
    php-imap
    php-intl
    php-phpdbg
    php-sqlite
    php-xsl
    xdebug
    composer
  )

  sudo pacman --needed -S ${standardPackages[@]} ${devPackages[@]}
}

_install_uninstall_desktop_environment() {
  local mode="$1"
  local de="$2"

  local name=""
  local includePackages=()
  local excludePackages=()

  case "${de}" in
    kde)
      name="kde"

      includePackages=(
        plasma
        plasma-wayland-session
        phonon-qt5-gstreamer
        ark
        baka-mplayer
        dolphin
        dolphin-plugins
        ffmpegthumbs
        gwenview
        k3b
        kamera
        kate
        kcolorchooser
        kcalc
        kcharselect
        kdialog
        kgpg
        kio-extras
        kompare
        konsole
        krdc
        kwalletmanager
        okular
        print-manager
        spectacle
        materia-kde
        kvantum-theme-materia
        kdeconnect
        keepassxc
        networkmanager
      )

      excludePackages=(
        plasma-workspace-wallpapers
        drkonqi
        discover
        oxygen
        sddm
        sddm-kcm
      )
    ;;
    gnome)
      name="gnome"

      includePackages=(
        gnome
        brasero
        dconf-editor
        ghex
        gnome-tweaks
        alacritty
        gitg
        rawtherapee
        meld
        termite
      )

      excludePackages=(
        baobab
        yelp
        orca
        gnome-terminal
        gnome-boxes
        gnome-user-share
        gnome-user-docs
        gnome-getting-started-docs
        gnome-software
        # gnome-calendar
        # gnome-contacts
        # gnome-maps
        # gnome-todo
      )
    ;;
  esac

  if [ "${name}" = "" ]; then
    log_warning "Not installing DE since none or an unknown has been specified" "${de}"
    return
  fi

  local ignorePackages=()
  for pkgName in "${excludePackages[@]}"; do
    ignorePackages+=(--ignore ${pkgName})
  done

  case "${mode}" in
    install)
      sudo expect <<EOF
set send_slow {1 .1}
  proc send {ignore arg} {
  sleep .1
exp_send -s -- \$arg
}
set timeout 3600
spawn pacman --needed -S ${includePackages[@]} ${ignorePackages[@]}
expect {
  -exact "anyway? \[Y/n\] " { send -- "n\r"; exp_continue }
  -exact "(default=all): " { send -- "\r"; exp_continue }
  -exact "installation? \[Y/n\]" { send -- "y\r"; exp_continue }
}
EOF
    ;;

    uninstall)
      sudo pacman -Rcu ${includePackages[@]}
    ;;

    *)
      log_warning "Unknown installation mode specified" "${mode}"
    ;;
  esac
}

_main $@
