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

# common stuff
export EDITOR=vim
export VISUAL=vim
export WINEARCH=win32
export TERM="xterm-256color"
export BROWSER=chromium

# ruby
rubyVersion=2.2.0
export GEM_HOME=~/.gem/ruby/${rubyVersion}
PATH=$PATH:$HOME/.gem/ruby/${rubyVersion}/bin

# go
export GOPATH=$HOME/.go

# virsh: system hypervisor as default connect
export VIRSH_DEFAULT_CONNECT_URI=qemu:///system

# node: global npm packages should be local for every user and not conflict with system installed npm packagesi
export NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# python virtual envs
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# sourcing it always causes delays
need_virtual_envs() { source /usr/bin/virtualenvwrapper.sh; }

# home scripts
PATH="${HOME}/.bin:${PATH}"

# bspwm
export _JAVA_AWT_WM_NONREPARENTING=1

export PATH
