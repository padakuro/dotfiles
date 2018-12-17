#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

ensure_arch_package "gnupg"
ensure_arch_package "ccid" # USB smartcard support
ensure_arch_package "pcsc-tools" # Smartcard tools

install_directory "${DOTFILES_SELF_ROOT}/.gnupg"
install_directory "${DOTFILES_SELF_ROOT}/.zsh"

chmod 700  "${DOTFILES_SELF_ROOT}/.gnupg"

grep "pinentry-program" ${DOTFILES_HOME}/.gnupg/gpg-agent.conf > /dev/null
if [ $? -ne 0 ]; then
  echo "pinentry-program ${DOTFILES_HOME}/.gnupg/pinentry.sh" >> ${DOTFILES_HOME}/.gnupg/gpg-agent.conf
fi

local caFile="/usr/share/ca-certificates/trust-source/anchors/sks-keyservers.netCA.crt"

if [ ! -f "${caFile}" ]; then
  log_info "Installing SKS seyserver CA"
  ${DOTFILES_DRY_RUN} curl -L -o "/tmp/sks-keyservers.netCA.crt" "https://sks-keyservers.net/sks-keyservers.netCA.pem"
  sudo mv "/tmp/sks-keyservers.netCA.crt" "${caFile}"
  sudo update-ca-trust
fi

sudo chown root:root "${caFile}"
