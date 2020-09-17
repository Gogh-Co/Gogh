#!/usr/bin/env bash

trap 'unset GOGH_DRY_RUN; unset -f color; trap - EXIT' EXIT HUP INT QUIT PIPE TERM

if [[ "${COLORTERM:-}" != "truecolor" ]] && [[ "${COLORTERM:-}" != "24bit" ]]; then
  printf '%s\n' "TrueColor support is needed for this to function"   \
                "You can try to manually set COLORTERM to truecolor"
  exit 1
fi

# Print all themes without applying, this variable gets checked in apply-colors.sh
export GOGH_DRY_RUN=1 

color () {
  printf '%b\n'   "${DEMO_COLOR_01} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 01 'tput setaf 0'"  # black
  printf '%b\n'   "${DEMO_COLOR_02} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 02 'tput setaf 1'"  # red
  printf '%b\n'   "${DEMO_COLOR_03} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 03 'tput setaf 2'"  # green
  printf '%b\n'   "${DEMO_COLOR_04} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 04 'tput setaf 3'"  # yellow
  printf '%b\n'   "${DEMO_COLOR_05} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 05 'tput setaf 4'"  # blue
  printf '%b\n'   "${DEMO_COLOR_06} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 06 'tput setaf 5'"  # pruple
  printf '%b\n'   "${DEMO_COLOR_07} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 07 'tput setaf 6'"  # cyan
  printf '%b\n\n' "${DEMO_COLOR_08} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 08 'tput setaf 7'"  # white
  printf '%b\n'   "${DEMO_COLOR_09} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 09 'tput setaf 8'"  # bold black
  printf '%b\n'   "${DEMO_COLOR_10} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 10 'tput setaf 9'"  # bold red
  printf '%b\n'   "${DEMO_COLOR_11} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 11 'tput setaf 10'" # bold green
  printf '%b\n'   "${DEMO_COLOR_12} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 12 'tput setaf 11'" # bold yellow
  printf '%b\n'   "${DEMO_COLOR_13} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 13 'tput setaf 12'" # bold blue
  printf '%b\n'   "${DEMO_COLOR_14} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 14 'tput setaf 13'" # bold purple
  printf '%b\n'   "${DEMO_COLOR_15} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 15 'tput setaf 14'" # bold cyan
  printf '%b\n\n' "${DEMO_COLOR_16} ███ *** AaBbCs ---  ███ $(tput sgr0)   ---> Color 16 'tput setaf 15'" # bold white
}

export -f color

declare -a THEMES=(
  'omni.sh'
  )

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/birobirobiro/Gogh/master/gogh.sh"}
PROGRESS_URL="https://raw.githubusercontent.com/phenonymous/shell-progressbar/1.0/progress.sh"

capitalize() {
  local ARGUMENT=$1
  local RES=""
  local STR=""
  local RES_NO_TRAIL_SPACE=""

  for CHAR in $ARGUMENT
  do
    STR=$(echo "${CHAR:0:1}" | tr "[:lower:]" "[:upper:]")"${CHAR:1} "
    RES="${RES}${STR}"
    RES_NO_TRAIL_SPACE="$(echo -e "${RES}" | sed -e 's/[[:space:]]*$//')"
  done

  echo "${RES_NO_TRAIL_SPACE}"
}

set_gogh() {
  url="${BASE_URL}/themes/$1"

  # Evaluate if Gogh was called from local source - i.e cloned repo
  SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  PARENT_PATH="$(dirname "${SCRIPT_PATH}")"
  if [[ -e "${PARENT_PATH}/themes/$1" ]]; then
    bash "${PARENT_PATH}/themes/$1"
  else
    if [[ "$(uname)" = "Darwin" ]]; then
      bash -c "$(curl -so- "${url}")"
    else
      bash -c "$(wget -qO- "${url}")"
    fi
  fi
}

remove_file_extension (){
  echo "${1%.*}"
}

# Fancy progress bar
# Note: We use eval here because we want the functions to be available in this script
if [[ "$(uname)" = "Darwin" ]]; then
  eval "$(curl -so- ${PROGRESS_URL})" 2> /dev/null
else
  eval "$(wget -qO- ${PROGRESS_URL})"  2> /dev/null
fi

declare color_dot_str
for c in {0..15}; do
  color_dot_str+="$(tput setaf $c)•$(tput sgr0)"
  [[ $c == 7 ]] && color_dot_str+=" "
done

command -v bar::start > /dev/null && bar::start

for THEME in "${THEMES[@]}"; do
  LOOP=$((${LOOP:-(-1)}+1))
  command -v bar::status_changed > /dev/null && bar::status_changed $LOOP ${#THEMES[@]}

  FILENAME=$(remove_file_extension "${THEME}")
  FILENAME_SPACE="${FILENAME//-/ }"
  echo -e "\nTheme: $(capitalize "${FILENAME_SPACE}")"
  echo "${color_dot_str}"
  echo
  set_gogh "${THEME}"
done

LOOP=$((${LOOP:-(-1)}+1))
command -v bar::status_changed > /dev/null && bar::status_changed $LOOP ${#THEMES[@]}

command -v bar::stop > /dev/null && bar::stop || :
