#!/usr/bin/env bash

# Define traps and trapfunctions early in case any errors before script exits
GLOBAL_VAR_CLEANUP(){
  [[ -n "$(command -v TILIX_TMP_CLEANUP)" ]] && TILIX_TMP_CLEANUP
  unset PROFILE_NAME
  unset PROFILE_SLUG
  unset TILIX_RES
  unset TERMINAL
}

trap 'GLOBAL_VAR_CLEANUP; trap - EXIT' EXIT HUP INT QUIT PIPE TERM


## minig Themes
declare -a THEMES=(
  'mono-amber.sh'
  'mono-cyan.sh'
  'mono-green.sh'
  'mono-red.sh'
  'mono-white.sh'
  'mono-yellow.sh'
)

# Allow developer to change url to forked url for easier testing
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/jack23247/minig/master"}
PROGRESS_URL="https://raw.githubusercontent.com/phenonymous/shell-progressbar/1.0/progress.sh"

upcase() {
  local ARGUMENT=$2
  local RES=""
  local RES_NO_TRAIL_SPACE=""

  RES="$(echo "${ARGUMENT}" | tr "[:lower:]" "[:upper:]")"
  RES_NO_TRAIL_SPACE="$(echo -e "${RES}" | sed -e 's/[[:space:]]*$//')"

  echo "${RES_NO_TRAIL_SPACE}"
}

upcase_first() {
  local ARGUMENT=$1
  local RES=""
  local RES_NO_TRAIL_SPACE=""

  RES="$(echo "${ARGUMENT}" | tr "[:lower:]" "[:upper:]")"
  RES_NO_TRAIL_SPACE="$(echo -e "${RES}" | sed -e 's/[[:space:]]*$//')"

  echo "${RES_NO_TRAIL_SPACE}"
}


set_gogh() {
  string=$1
  string_r="${string%???}"
  string_s=${string_r//\./_}
  result=$(upcase_first "${string_s}")
  url="${BASE_URL}/themes/$1"

  export {PROFILE_NAME,PROFILE_SLUG}="$result"

  # Evaluate if Gogh was called from local source - i.e cloned repo
  SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  if [[ -e "${SCRIPT_PATH}/themes/$1" ]]; then
    bash "${SCRIPT_PATH}/themes/$1"
  else
    if [[ "$(uname)" = "Darwin" ]]; then
      # OSX ships with curl
      bash -c "$(curl -sLo- "${url}")"
    else
      # Linux ships with wget
      bash -c "$(wget -qO- "${url}")"
    fi
  fi
}


remove_file_extension (){
  echo "${1%.*}"
}


### Get length of an array
ARRAYLENGTH=${#THEMES[@]}
NUM=1

### Prompt
clear
if [[ ${COLUMNS:-$(tput cols)} -ge 80 ]]; then
  minig_str=""
  minig_str+="      ___                       ___                       ___      \n"
  minig_str+="     /__/\        ___          /__/\        ___          /  /\     \n"
  minig_str+="    |  |::\      /  /\         \  \:\      /  /\        /  /:/_    \n"
  minig_str+="    |  |:|:\    /  /:/          \  \:\    /  /:/       /  /:/ /\   \n"
  minig_str+="  __|__|:|\:\  /__/::\      _____\__\:\  /__/::\      /  /:/_/::\  \n"
  minig_str+=" /__/::::| \:\ \__\/\:\__  /__/::::::::\ \__\/\:\__  /__/:/__\/\:\ \n"
  minig_str+=" \  \:\~~\__\/    \  \:\/\ \  \:\~~\~~\/    \  \:\/\ \  \:\ /~~/:/ \n"
  minig_str+="  \  \:\           \__\::/  \  \:\  ~~~      \__\::/  \  \:\  /:/  \n"
  minig_str+="   \  \:\          /__/:/    \  \:\          /__/:/    \  \:\/:/   \n"
  minig_str+="    \  \:\         \__\/      \  \:\         \__\/      \  \::/    \n"
  minig_str+="     \__\/                     \__\/                     \__\/     \n"
  minig_str+=""
  printf '%b\n' "${minig_str}"
fi

echo -e "\n MINIG - A MINI (RETRO) FORK OF GOGH\n OPTIONS: \n"
for TH in "${THEMES[@]}"; do
  KEY=$(printf "%02d" $NUM)
  FILENAME=${TH::$((${#TH}-3))}
  FILENAME_SPACE=${FILENAME//-/ }
  echo -e "  $KEY -> $(upcase ${FILENAME_SPACE})"
  ((NUM++))
done

echo -e ""
read -r -p ' OPTION? [%d | <RET>] >>> ' -a OPTION

# |
# | ::::::: Get terminal
# |
if [[ -z "${TERMINAL:-}" ]]; then
  # |
  # | Check for the terminal name (depening on os)
  # | ===========================================
  OS="$(uname)"
  if [[ "$OS" = "Darwin" ]]; then
    TERMINAL=$TERM_PROGRAM
  elif [[ "${OS#CYGWIN}" != "${OS}" ]]; then
    TERMINAL="mintty"
  else
    # |
    # | Depending on how the script was invoked, we need
    # | to loop until pid is no longer a subshell
    # | ===========================================
    pid="$$"
    TERMINAL="$(ps -h -o comm -p $pid)"
    while [[ "${TERMINAL:(-2)}" == "sh" ]]; do
      pid="$(ps -h -o ppid -p $pid)"
      TERMINAL="$(ps -h -o comm -p $pid)"
    done
  fi
fi


# |
# | ::::::: Fancy progressbar for lengthy operations
# |
if [[ ${#OPTION[@]} -gt 5 ]]; then
  # Note: We use eval here because we want the functions to be available in this script
  if [[ "$(uname)" = "Darwin" ]]; then
    eval "$(curl -so- ${PROGRESS_URL})" 2> /dev/null
  else
    eval "$(wget -qO- ${PROGRESS_URL})"  2> /dev/null
  fi
fi


# |
# | Tilix supports fg/bg in color schemes - ask wether user wants to go that route
# | This is to avoid creating multiple profiles just for colors
# | ===========================================
if [[ "$TERMINAL" = "tilix" ]] && [[ ${#OPTION[@]} -gt 0 ]]; then
  echo
  read -r -p "Tilix detected - use color schemes instead of profiles? [y/N] " -n 1 TILIX_RES
  echo

  # |
  # | When selecting multiple themes and user opts for color schemes, we save all themes
  # | in a tmpdir and copy the files once all themes has been processed.. If a user
  # | desides to abort before all themes has been processed this section will cleanup the tmpdir
  # | =======================================
  if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
    TILIX_TMP_CLEANUP() {
      echo
      echo "Cleaning up"
      rm -rf "$scratchdir"
      unset LOOP OPTLENGTH scratchdir
      echo "Done..."
      exit 0
    }

    scratchdir=$(mktemp -d -t tmp.XXXXXXXX)
    export scratchdir
  fi
fi


## Export one-off variables
[[ -n "${TILIX_RES:-}" ]] && export TILIX_RES
export TERMINAL LOOP OPTLENGTH=${#OPTION[@]}


## Apply Theme
# Note:
# Constants with a leading 0 are interpreted as octal numbers
# Hence option 08 and 09 will not work
# Solution is to remove the leading 0 from the parsed options
command -v bar::start > /dev/null && bar::start
for OP in "${OPTION[@]#0}"; do
  # See appy_tilixschemes in apply-colors.sh for usage of LOOP
  LOOP=$((${LOOP:-0}+1))

  command -v bar::status_changed > /dev/null && bar::status_changed $LOOP ${#OPTION[@]}

  if [[ OP -le ARRAYLENGTH && OP -gt 0 ]]; then

    echo -e "\b OK."
    echo

    SET_THEME="${THEMES[((OP-1))]}"
    set_gogh "${SET_THEME}"
  else
    echo -e "\b INVALID!\n"
    exit 1
  fi
done
# If you skip || : and the command does not exist the script will exit with code 1
# this will always return exit code 0 if we got this far
command -v bar::stop > /dev/null && bar::stop || :
