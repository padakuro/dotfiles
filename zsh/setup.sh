#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

symlink_files "${DOTFILES_SELF_ROOT}"
symlink_files "${DOTFILES_SELF_ROOT}/.zsh" "${DOTFILES_SELF_ROOT}"
symlink_directory "${DOTFILES_SELF_ROOT}/.zsh/zplug" "${DOTFILES_SELF_ROOT}"

ensure_directory "${DOTFILES_HOME}/.zsh/plugins"

${DOTFILES_DRY_RUN} text_write "${DOTFILES_HOME}/.zsh/dotfiles.zprofile" "export PATH=\"\${PATH}:${DOTFILES_ROOT}/dotfiles/bin\""
