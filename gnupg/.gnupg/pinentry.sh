#!/usr/bin/env bash

case "${XDG_CURRENT_DESKTOP}" in
  GNOME)
    exec /usr/bin/pinentry-gnome3 "$@"
    ;;
  KDE)
    exec /usr/bin/pinentry-qt "$@"
    ;;
  *)
    exec /usr/bin/pinentry "$@"
    ;;
esac
