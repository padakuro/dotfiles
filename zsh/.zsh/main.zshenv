export TERM='st-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

if [[ -z "${LANG}" ]]; then
  export LANG='en_US.UTF-8'
fi

export PATH="${HOME}/.bin:${PATH}"
