# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh: command history
HISTSIZE=100000
SAVEHIST=100000

# zsh: aliases
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
alias gulp='node ./node_modules/gulp/bin/gulp.js'

# common stuff
export EDITOR=vim
export VISUAL=vim
export WINEARCH=win32
export TERM="xterm-256color"

# ruby
export GEM_HOME=~/.gem/ruby/2.1.0
export PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin

# go
export GOPATH=$HOME/.go

# virsh: system hypervisor as default connect
export VIRSH_DEFAULT_CONNECT_URI=qemu:///system

# node: global npm packages should be local for every user and not conflict with system installed npm packagesi
export NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# python virtual envs
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# sourcing it always causes delays
need_virtual_envs() { source /usr/bin/virtualenvwrapper.sh; }

# konsole: map CTRL+left/right to backward/forward word (KDE Konsole)
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word

tcsh-backward-word() {
    local WORDCHARS="${WORDCHARS:s@/@}"
      zle backward-word
}
zle -N tcsh-backward-word

# keychain: agent
eval $(keychain --eval --agents ssh -Q --quiet)
