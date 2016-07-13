# https://wiki.archlinux.org/index.php/Zsh#Startup.2FShutdown_files
# Mainly used because /etc/profile overwrites PATH
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zprofile; do
  source "${rcfile}"
done
unset rcfile
