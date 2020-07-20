# PermitUserEnvironment is off on most servers, so using ~/.ssh/environment
# is not feasible. tmux-256color is available on most recent systems, so
# this should work most of the time
alias ssh='TERM=tmux-256color ssh'
