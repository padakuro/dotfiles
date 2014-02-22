# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# command history is bliss
HISTSIZE=100000
SAVEHIST=100000

# aliases
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias lla='ll -a'
alias tree='tree -C'
alias less='/usr/share/vim/vim74/macros/less.sh'
alias ledate='date +"%Y%m%d-%H%M"'
alias ledates='date +"%Y%m%d-%H%M%S"'
alias rm='rm -I'
alias sedit='sudoedit'
alias sfdev='app/console --env=dev'
alias sfprod='app/console --env=prod'
alias sftest='app/console --env=test'
#alias composer="hhvm $(which composer)"

# export all the vars
export WINEARCH=win32
export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin

# map CTRL+left/right to backward/forward word (KDE Konsole)
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

tcsh-backward-word() {
    local WORDCHARS="${WORDCHARS:s@/@}"
      zle backward-word
}
zle -N tcsh-backward-word

# keychain agent
eval $(keychain --eval --agents ssh -Q --quiet)
