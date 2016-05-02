alias ls='ls -h --color=auto'
alias ll='ls -l'
alias lla='ll -a'
alias tree='tree -h -C'
alias ledate='date +"%Y%m%d"'
alias ledatet='date +"%Y%m%d-%H%M"'
alias ledatets='date +"%Y%m%d-%H%M%S"'
alias rm='rm -I'
alias sedit='sudoedit'

# the specified TERM on my workstation might not be available in other distros
# such as CoreOS
alias ssh='TERM=xterm-256color ssh'
