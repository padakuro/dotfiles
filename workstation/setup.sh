#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

_main() {
  cmd="$1"; shift;

  case "${cmd}" in
    install|uninstall)
      _un_install_packages ${cmd} $@
    ;;
    *)
      _install_self
    ;;
  esac
}

_un_install_packages() {
  local mode="$1"; shift;

  local packages=()
  local excludePackages=()

  for bundle in $@; do
    log_section_begin "Adding bundle: ${bundle}"

    case "${bundle}" in
      standard)
        packages+=(
          tmux
          tree
          pv
          expect
          p7zip
          nftables
          neovim
          sudo
          nss
          which
          exa
          watchexec
          ripgrep
          tokei
          fd
          dust
          sd
          bat
          procs
          zoxide
        )
      ;;
      desktop)
        packages+=(
          ntfs-3g
          ghostscript
          ffmpeg
          gimp
          chromium
          firefox
        )
      ;;
      laptop)
        packages+=(
          powertop
        )
      ;;
      gaming)
        packages+=(
          wine-staging
        )
      ;;
      development|dev)
        packages+=(
          atom

          nodejs

          php
          php-apcu
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
      ;;
      kde)
        packages+=(
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
        excludePackages+=(
          plasma-workspace-wallpapers
          drkonqi
          discover
          oxygen
          sddm
          sddm-kcm
        )
      ;;
      gnome)
        packages+=(
          gnome
          brasero
          dconf-editor
          ghex
          gnome-tweaks
          gitg
          meld
          termite
          pdfarranger
        )
        excludePackages+=(
          epiphany
          baobab
          yelp
          orca
          gnome-terminal
          gnome-boxes
          gnome-books
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
      *)
        log_error "Bundle is unknown"
      ;;
    esac

    log_section_end
  done

  local ignorePackages=()
  for pkgName in "${excludePackages[@]}"; do
    ignorePackages+=(--ignore ${pkgName})
  done

  ensure_arch_package "expect"

  case "${mode}" in
    install)
      sudo expect <<EOF
set send_slow {1 .1}
  proc send {ignore arg} {
  sleep .1
exp_send -s -- \$arg
}
set timeout 3600
spawn pacman --needed -S ${packages[@]} ${ignorePackages[@]} ${WS_PACMAN_CLI}
expect {
  -exact "anyway? \[Y/n\] " { send -- "n\r"; exp_continue }
  -exact "(default=all): " { send -- "\r"; exp_continue }
  -exact "installation? \[Y/n\]" { send -- "y\r"; exp_continue }
}
EOF
    ;;
    uninstall)
      sudo pacman -Rcu ${packages[@]}
    ;;
  esac
}

_install_self() {
  install_directory "${DOTFILES_SELF_ROOT}/.config"
  install_directory "${DOTFILES_SELF_ROOT}/.zsh"
}

_main $@
