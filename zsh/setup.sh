#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_arch_package "zsh"
ensure_directory "${DOTFILES_HOME}/.zsh/plugins"
install_directory "${DOTFILES_SELF_ROOT}/.zsh"
install_files \
  "${DOTFILES_SELF_ROOT}/.zprofile" \
  "${DOTFILES_SELF_ROOT}/.zshenv" \
  "${DOTFILES_SELF_ROOT}/.zshrc"

# common command completions
install_git "${DOTFILES_HOME}/.zsh/plugins/zsh-completions" "https://github.com/zsh-users/zsh-completions.git" "b3876c59827c0f3365ece26dbe7c0b0b886b63bb"

# CTRL+R history search 
install_git "${DOTFILES_HOME}/.zsh/plugins/zsh-fzf-history-search" "https://github.com/joshskidmore/zsh-fzf-history-search.git" "07c075c13938a7f527392dd73da2595a752cae6b"

# tab autocomplete menu with fzf (replaces the default zsh tab menu)
install_git "${DOTFILES_HOME}/.zsh/plugins/fzf-tab" "https://github.com/Aloxaf/fzf-tab.git" "e85f76a3af3b6b6b799ad3d64899047962b9ce52"

# command syntax highlight
install_git "${DOTFILES_HOME}/.zsh/plugins/zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git" "c7caf57ca805abd54f11f756fda6395dd4187f8a"

# pure prompt
install_git "${DOTFILES_HOME}/.zsh/plugins/pure" "https://github.com/sindresorhus/pure.git" "90dc9cf908481cc155e1ce5611f684916523fc30"

# refresh completions
if [ -d "${DOTFILES_HOME}/.zcompdump" ]; then
  rm "${DOTFILES_HOME}/.zcompdump"
fi
