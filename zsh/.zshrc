pluginDir="${HOME}/.zsh/plugins"

fpath=(${pluginDir}/zsh-completions/src $fpath)
autoload -U compinit && compinit

source ${pluginDir}/fzf-tab/fzf-tab.zsh
source ${pluginDir}/zsh-fzf-history-search/zsh-fzf-history-search.zsh

fpath+=${pluginDir}/pure
autoload -U promptinit; promptinit
prompt pure

source ${pluginDir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unset pluginDir

# load custom configs
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshrc; do
  source "${rcfile}"
done
unset rcfile