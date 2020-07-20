#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

# from: https://twistedlinux.wordpress.com/2015/11/05/prevent-wine-to-install-mime-hooks/

# remove existing stuff
rm -vf ${DOTFILES_HOME}/.local/share/mime/packages/x-wine*
rm -vf ${DOTFILES_HOME}/.local/share/applications/wine-extension*
rm -vrf ${DOTFILES_HOME}/.local/share/applications/wine/Programs/*
rm -vf ${DOTFILES_HOME}/.local/share/icons/hicolor/*/*/application-x-wine-extension*
rm -vf ${DOTFILES_HOME}/.local/share/mime/application/x-wine-extension*
find ${DOTFILES_HOME}/.local/share/mime -name '*wine*' -exec rm -vf {} \;
update-mime-database ${DOTFILES_HOME}/.local/share/mime

grep "winemenubuilder.exe -a -r" /usr/share/wine/wine.inf
if [ $? -ne 1 ]; then
  log_section_begin "Wine mime builder is still active!"
  log_info "Remove the '-a' switch from winemenubuilder.exe in the [Services] section of /usr/share/wine/wine.inf"
  log_section_end
fi
