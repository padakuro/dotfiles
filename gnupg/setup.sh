#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_arch_package "gnupg"
ensure_arch_package "ccid" # USB smartcard support
ensure_arch_package "pcsc-tools" # Smartcard tools

symlink_files "${DOTFILES_SELF_ROOT}/.gnupg" "${DOTFILES_SELF_ROOT}"
symlink_files "${DOTFILES_SELF_ROOT}/.zsh" "${DOTFILES_SELF_ROOT}"

local caFile="/usr/share/ca-certificates/trust-source/anchors/sks-keyservers.netCA.crt"

if [ ! -f "${caFile}" ]; then
  log_info "Installing SKS seyserver CA"
  ${DOTFILES_DRY_RUN} curl -L -o "/tmp/sks-keyservers.netCA.crt" "https://sks-keyservers.net/sks-keyservers.netCA.pem"
  sudo mv "/tmp/sks-keyservers.netCA.crt" "${caFile}"
  sudo update-ca-trust
fi