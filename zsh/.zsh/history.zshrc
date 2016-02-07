setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

HISTSIZE=133742
SAVEHIST=133742
HISTFILE="${HOME}/.zhistory"

bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down
