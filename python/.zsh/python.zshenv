# python virtual envs
export WORKON_HOME="${HOME}/.virtualenvs"
export PIP_VIRTUALENV_BASE="${WORKON_HOME}"
export PIP_RESPECT_VIRTUALENV=true

# sourcing it always causes delays
need_virtual_envs() { source /usr/bin/virtualenvwrapper.sh; }
