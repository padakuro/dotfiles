# load the plugin manager and plugins
source ${HOME}/.zsh/zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
#zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "${HOME}/.zsh/plugins", from:local
zplug load

# load custom configs
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshrc; do
  source "${rcfile}"
done
unset rcfile
