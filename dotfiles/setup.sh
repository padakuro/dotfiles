#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

${DOTFILES_DRY_RUN} text_write "${DOTFILES_HOME}/.zsh/dotfiles.zprofile" "export PATH=\"\${PATH}:${DOTFILES_ROOT}/dotfiles/bin\""
${DOTFILES_DRY_RUN} text_write "${DOTFILES_HOME}/.zsh/dotfiles.zshenv" "export DOTFILES_HOME="${DOTFILES_HOME}""
