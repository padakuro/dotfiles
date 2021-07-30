zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

zmodload -i zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:git-commit:*' sort false
zstyle ':completion:*:git-log:*' sort false
zstyle ':completion:*:tig:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
