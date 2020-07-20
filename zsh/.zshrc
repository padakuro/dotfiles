# load the plugin manager and plugins
source ~/.zsh/zinit/zinit.zsh

zinit light "zsh-users/zsh-history-substring-search"
zinit ice pick"async.zsh" src"pure.zsh"
zinit light "sindresorhus/pure"

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" "zdharma/fast-syntax-highlighting" \
  atload"_zsh_autosuggest_start" "zsh-users/zsh-autosuggestions" \
  "zdharma/history-search-multi-word" \
  blockf atpull"zinit creinstall -q ." "zsh-users/zsh-completions"

# load custom configs
for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/*.zshrc; do
  source "${rcfile}"
done
unset rcfile
