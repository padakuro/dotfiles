#!/usr/bin/env zsh
if [ ${#DOTFILES_LIB_ROOT} -lt 5 ]; then echo "No no no."; exit 1; fi; source "${DOTFILES_LIB_ROOT}/index"

localApplicationsDir="${DOTFILES_HOME}/.local/share/applications"

# create an isolated chromium profile incl. a custom desktop launcher
create_profile() {
  local packageDesktopFile="/usr/share/applications/chromium.desktop"
  if [ ! -f "${packageDesktopFile}" ]; then
    log_error "Chromium desktop file does not exist: ${packageDesktopFile}"
    exit 1
  fi

  local name="$1"
  local color="$2"
  local desktopFile="${localApplicationsDir}/chromium-${name}.desktop"
  local profileDir="${DOTFILES_HOME}/.config/chromium-${name}"
  local iconFile="${profileDir}/icon.svg"

  if [ ! -d "${profileDir}" ]; then
    log_info "Creating chromium profile directory: ${profileDir}"
    mkdir -p "${profileDir}"
  fi

  # custom wm class so the custom launcher icon will be properly linked
  local wmClass="chromium-${name}"

  cp "${packageDesktopFile}" "${desktopFile}"
  sed -i -r \
    -e "s|^(Exec=/usr/bin/chromium)|\1 --user-data-dir=${profileDir} --class=${wmClass}|" \
    -e "/^Icon=chromium/a StartupWMClass=${wmClass}" \
    -e "s|^Icon=(.+)|Icon=${iconFile}|" \
    -e "s|^Name=Chromium|Name=Chromium (${name})|" \
    "${desktopFile}"

  cp "${DOTFILES_SELF_ROOT}/icon.svg" "${iconFile}"

  # http://blueprintjs.com/docs/v2/#core/colors
  # top=@2 | left=@4 | right=@5 | mid=@5
  local cTop=
  local cLeft=
  local cRight=
  local cMid=
  case "${color}" in
    green)
      cTop="#0D8050"; cLeft="#15B371"; cRight="#3DCC91"; cMid="${cRight}"
    ;;
    orange)
      cTop="#BF7326"; cLeft="#F29D49"; cRight="#FFB366"; cMid="${cRight}"
    ;;
    red)
      cTop="#C23030"; cLeft="#F55656"; cRight="#FF7373"; cMid="${cRight}"
    ;;
    rose|pink)
      cTop="#C22762"; cLeft="#F5498B"; cRight="#FF66A1"; cMid="${cRight}"
    ;;
    indigo|violet)
      cTop="#634DBF"; cLeft="#9179F2"; cRight="#AD99FF"; cMid="${cRight}"
    ;;
    cobalt|blue)
      cTop="#2458B3"; cLeft="#4580E6"; cRight="#669EFF"; cMid="${cRight}"
    ;;
    turquoise|cyan)
      cTop="#00998C"; cLeft="#14CCBD"; cRight="#2EE6D6"; cMid="${cRight}"
    ;;
    lime)
      cTop="#87A629"; cLeft="#B6D94C"; cRight="#D1F26D"; cMid="${cRight}"
    ;;
    dark)
      # top=@dark-gray2 | left=@dark-gray5 | right=@gray2 | mid=@gray2
      cTop="#202B33"; cLeft="#394B59"; cRight="#738694"; cMid="${cRight}"
    ;;
    *)
      return
    ;;
  esac

  # top | left | right | mid
  sed -i -r \
    -e "s|#3c71a7|${cTop}|" \
    -e "s|#77b4ed|${cLeft}|" \
    -e "s|#c2e1ff|${cRight}|" \
    -e "s|#6b9edf|${cMid}|" \
    "${iconFile}"
}

hide_default_launcher() {
  ensure_directory "${localApplicationsDir}"
  install_directory "${DOTFILES_SELF_ROOT}/.local"
}

case "$1" in
  create)
    create_profile "$2" "$3"
  ;;

  hide)
    hide_default_launcher
  ;;
esac
