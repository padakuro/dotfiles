#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

commonPkgs=(
  git-plus
  atom-beautify
  split-diff
  file-icons
  autocomplete-paths
  merge-conflicts
  language-docker
)

goPkgs=(
  go-plus
  linter
)

webPkgs=(
  atom-typescript
  pigments
  color-picker
  atom-ternjs
  docblockr
  language-babel

  php-integrator-base
  php-integrator-autocomplete-plus
  php-integrator-navigation
  php-integrator-tooltips
  php-integrator-linter
  php-integrator-annotations
  php-integrator-call-tips
  php-integrator-refactoring
)

elixirPkgs=(
  language-elixir
  atom-elixir
)

install_pkgs() {
  local atomHome="$1"; shift
  local pkgs=("$@")

  log_section_begin "Packages for: ${atomHome}"

  export ATOM_HOME="${atomHome}"
  local installed=$(apm list --bare --installed)

  local needed=()
  for pkg in "${pkgs[@]}"; do
    ok=$(echo "${installed}" | grep "${pkg}")
    if [ $? -eq 0 ]; then
      continue
    fi

    needed+=(${pkg})
  done

  if [ ${#needed} -eq 0 ]; then
    log_info "Nothing to install."
    log_section_end
    return
  fi

  log_info "Installing: ${needed}"
  apm install ${needed}

  log_section_end
}

update_pkgs() {
  local atomHome="$1"; shift

  export ATOM_HOME="${atomHome}"
  apm upgrade --confirm false
}

case "$1" in
  update)
    update_pkgs ~/.atom
    update_pkgs ~/.atom-go
    update_pkgs ~/.atom-web
    update_pkgs ~/.atom-elixir
  ;;

  install)
    install_pkgs ~/.atom "${commonPkgs[@]}"
    install_pkgs ~/.atom-go "${commonPkgs[@]}" "${goPkgs[@]}"
    install_pkgs ~/.atom-web "${commonPkgs[@]}" "${webPkgs[@]}"
    install_pkgs ~/.atom-elixir "${commonPkgs[@]}" "${elixirPkgs[@]}"
  ;;

  *)
    symlink_files "${DOTFILES_SELF_ROOT}/.zsh" "${DOTFILES_SELF_ROOT}"
  ;;
esac
