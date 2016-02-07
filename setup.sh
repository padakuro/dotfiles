#!/usr/bin/env zsh

print_section() {
  local name="$1"
  echo -e "\e[30;42m > ${name} \e[0m"
}

print_info() {
  local text="$1"
  echo -e " - ${text}"
}

ensure_directory() {
  local dir="$1"

  if [ ! -d ${dir} ]; then
      mkdir -vp ${dir}
  fi
}

check_arch_package() {
  local name="$1"

  result=$(pacman -Q ${name})
  if [ $? -eq 1 ]; then
    print_info " ! ${name} not installed"
  fi
}

print_section "updating dotfiles"
git submodule update --init --recursive

print_section "vim"
ensure_directory "${HOME}/.vim/.cache"
ensure_directory "${HOME}/.vim/.cache/undo"

print_section "python virtualenvs"
ensure_directory "${WORKON_HOME}"
check_arch_package "python-virtualenvwrapper"

print_section "packages"
check_arch_package "the_silver_searcher" # improved grep, also used by vim
check_arch_package "pulseaudio-ctl"
check_arch_package "fzf"
check_arch_package "neovim"

print_section "configuring npm for user-global install"
touch "${HOME}/.npmrc"
npm_prefix=$(grep "^prefix" "${HOME}/.npmrc")
if [ ! $? -eq 0 ]; then
  echo "prefix = ${NPM_PACKAGES}" >> ~/.npmrc
fi
