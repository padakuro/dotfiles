#!/usr/bin/env sh

ensure_directory() {
    local dir=$1

    if [ ! -d ${dir} ]; then
        mkdir -vp ${dir}
    fi
}

check_arch_package() {
    local name=$1
    
    pacman -Q ${name}
}

# vim directories
echo "Ensuring directories..."
ensure_directory "${HOME}/.vim/.cache"
ensure_directory "${HOME}/.vim/.cache/undo"

echo "Checking packages..."
check_arch_package "the_silver_searcher" # improved grep, also used by vim
