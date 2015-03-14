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

for rcfile in "${ZDOTDIR:-$HOME}"/.zsh/zshrc*(N); do
  source "${rcfile}"
done

