#!/usr/bin/env zsh
#
# dotfiles.sh management script
#

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
# eg. ~/.dotfiles/dotfiles/bin/../..
export DOTFILES_ROOT="$(cd "$(dirname ${(%):-%N})/../.." && pwd)"
export DOTFILES_LIB_ROOT="${DOTFILES_ROOT}/dotfiles/lib"
export DOTFILES_HOME="${DOTFILES_HOME:-$HOME}"

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

  symlink_recursive "${whatRoot}"
  log_section_end "Done"
}

cmd_init() {
  log_section_begin "Initializing dotfiles"

  log_info "Cloning submodules"
  ${DOTFILES_DRY_RUN} git -C "${DOTFILES_ROOT}" submodule update --init --recursive

  log_section_end
}

# cmd_update() {
#   log_section_begin "Updating dotfiles"
#
#   git -C "${DOTFILES_ROOT}" stash
#
#   log_info "Updating submodules"
#   git -C "${DOTFILES_ROOT}" submodule foreach git pull origin master
#
#   git -C "${DOTFILES_ROOT}" stash pop
# }

main "$@"
