#!/usr/bin/env sh

print_section() {
  local name=$1
  echo -e "\e[1;42m > $name \e[0m"
}

ensure_directory() {
  local dir=$1

  if [ ! -d ${dir} ]; then
      mkdir -vp ${dir}
  fi
}

check_arch_package() {
  local name=$1
  
  result=$(pacman -Q ${name})

  if [ "$?" != "0" ]; then
    echo ${result}
  fi
}

print_section "vim"
ensure_directory "${HOME}/.vim/.cache"
ensure_directory "${HOME}/.vim/.cache/undo"

print_section "python virtualenvs"
ensure_directory "${WORKON_HOME}"
check_arch_package "python-virtualenvwrapper"

print_section "additional packages"
check_arch_package "the_silver_searcher" # improved grep, also used by vim

print_section "configuring npm for home-global install"
npm_prefix=$(grep "^prefix" ~/.npmrc)
if [ "$?" != "0" ]; then
  echo "prefix = $NPM_PACKAGES" >> ~/.npmrc
fi
