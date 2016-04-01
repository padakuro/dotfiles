# load the plugin manager and plugins
source ~/.zsh/zplug/zplug

zplug "zsh-users/zsh-history-substring-search"
zplug "mafredri/zsh-async" \
  | zplug "sindresorhus/pure"
zplug "mollifier/anyframe"
zplug "willghatch/zsh-cdr"
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion"
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "${HOME}/.zsh/plugins", from:local
zplug load

# load custom configs
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshrc; do
  source "${rcfile}"
done