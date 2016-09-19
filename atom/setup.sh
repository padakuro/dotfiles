#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

commonPkgs=(
  git-plus
  atom-beautify
  split-diff
  file-icons
  autocomplete-paths
  merge-conflicts

  flatwhite-syntax
)

goPkgs=(
  go-plus
  autocomplete-go
  gofmt
  builder-go
  gometalinter-linter
  navigator-godef
  tester-go
  gorename
  go-debug
  godoc
  go-get
  go-config
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

install_pkgs ~/.atom "${commonPkgs[@]}"
install_pkgs ~/.atom-go "${commonPkgs[@]}" "${goPkgs[@]}"
install_pkgs ~/.atom-web "${commonPkgs[@]}" "${webPkgs[@]}"
