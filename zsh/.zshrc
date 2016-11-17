# load the plugin manager and plugins
source ${HOME}/.zsh/zplug/init.zsh

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
# zplug "mollifier/anyframe"
# zplug "willghatch/zsh-cdr"
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "${HOME}/.zsh/plugins", from:local
zplug load

source "${HOME}/.zsh/base16-shell/scripts/base16-solarized-dark.sh"

# load custom configs
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshrc; do
  source "${rcfile}"
done
unset rcfile
