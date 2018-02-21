#!/usr/bin/env zsh
#
# dotfiles.sh management script
#

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# eg. ~/.dotfiles/dotfiles/bin/../..
export DOTFILES_ROOT="$(cd "$(dirname ${(%):-%N})/../.." && pwd)"
export DOTFILES_LIB_ROOT="${DOTFILES_ROOT}/dotfiles/lib"
export DOTFILES_HOME="${DOTFILES_HOME:-$HOME}"
export DOTFILES_DB_FILE="${DOTFILES_HOME}/.dotfiles-db"

if [ "${DOTFILES_DRY_RUN}" != "" ]; then
  DOTFILES_DRY_RUN="log_dry"
fi
export DOTFILES_DRY_RUN
export DOTFILES_DEBUG

source "${DOTFILES_LIB_ROOT}/index"

main() {
  if [ $# -lt 1 ]; then
    log_error "No command given"
    exit 1
  fi

  local cmd="$1"; shift

  case "${cmd}" in
    init)
      cmd_init
    ;;

    setup)
      cmd_setup "$@"
    ;;

    status|log)
      cmd_git "${cmd}"
    ;;

    *)
      log_error "Unknown command:" "${cmd}"
      exit 1
    ;;
  esac
}

cmd_git() {
  local cmd="$1"
  git -C "${DOTFILES_ROOT}" "${cmd}"
}

cmd_setup() {
  local what="$1"; shift

  if [ "${what}" = "" ]; then
    log_error "No target specified"
    return 1
  fi

  local whatRoot="${DOTFILES_ROOT}/${what}"

  log_section_begin "Setting up: ${what}"

  local setupScript="${whatRoot}/setup.sh"
  if [ -f "${setupScript}" ]; then
    DOTFILES_SELF_ROOT="${whatRoot}" ${setupScript} "$@"
    log_section_end "Done"
    return 0
  fi

  install_module "${whatRoot}"

  log_section_end "Done"
}

cmd_init() {
  log_section_begin "Initializing dotfiles"

  log_section_end
}

main "$@"
