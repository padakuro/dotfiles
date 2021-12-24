setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

HISTSIZE=133742
SAVEHIST=133742
HISTFILE="${HOME}/.zhistory"

bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward