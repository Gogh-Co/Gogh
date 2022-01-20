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

# TO-DO: Investigate dynamically building this array e.g.
# curl -s https://github.com/Mayccoll/Gogh/tree/master/themes | grep -o "title=.*\.sh\" " | awk -F '=' '{print $2}'
declare -a THEMES=(
  '3024-day.sh'
  '3024-night.sh'
  'aci.sh'
  'aco.sh'
  'adventuretime.sh'
  'afterglow.sh'
  'alien-blood.sh'
  'argonaut.sh'
  'arthur.sh'
  'atom.sh'
  'aura.sh'
  'ayu-dark.sh'
  'ayu-light.sh'
  'ayu-mirage.sh'
  'azu.sh'
  'belafonte-day.sh'
  'belafonte-night.sh'
  'bim.sh'
  'birds-of-paradise.sh'
  'blazer.sh'
  'bluloco-light.sh'
  'bluloco-zsh-light.sh'
  'borland.sh'
  'broadcast.sh'
  'brogrammer.sh'
  'c64.sh'
  'cai.sh'
  'chalk.sh'
  'chalkboard.sh'
  'chameleon.sh'
  'ciapre.sh'
  'clone-of-ubuntu.sh'
  'clrs.sh'
  'cobalt-neon.sh'
  'cobalt2.sh'
  'colorcli.sh'
  'crayon-pony-fish.sh'
  'dark-pastel.sh'
  'darkside.sh'
  'dehydration.sh'
  'desert.sh'
  'dimmed-monokai.sh'
  'dissonance.sh'
  'dracula.sh'
  'earthsong.sh'
  'elemental.sh'
  'elementary.sh'
  'elic.sh'
  'elio.sh'
  'espresso-libre.sh'
  'espresso.sh'
  'fairyfloss.sh'
  'fairyflossdark.sh'
  'fishtank.sh'
  'flat-remix.sh'
  'flat.sh'
  'flatland.sh'
  'foxnightly.sh'
  'freya.sh'
  'frontend-delight.sh'
  'frontend-fun-forrest.sh'
  'frontend-galaxy.sh'
  'geohot.sh'
  'github.sh'
  'gogh.sh'
  'gooey.sh'
  'google-dark.sh'
  'google-light.sh'
  'gotham.sh'
  'grape.sh'
  'grass.sh'
  'gruvbox-dark.sh'
  'gruvbox.sh'
  'hardcore.sh'
  'harper.sh'
  'hemisu-dark.sh'
  'hemisu-light.sh'
  'highway.sh'
  'hipster-green.sh'
  'homebrew.sh'
  'horizon-bright.sh'
  'horizon-dark.sh'
  'hurtado.sh'
  'hybrid.sh'
  'ibm3270.sh'
  'ibm3270-hicontrast.sh'
  'ic-green-ppl.sh'
  'ic-orange-ppl.sh'
  'idle-toes.sh'
  'ir-black.sh'
  'jackie-brown.sh'
  'japanesque.sh'
  'jellybeans.sh'
  'jup.sh'
  'kibble.sh'
  'kokuban.sh'
  'laserwave.sh'
  'later-this-evening.sh'
  'lavandula.sh'
  'liquid-carbon-transparent.sh'
  'liquid-carbon.sh'
  'lunaria-dark.sh'
  'lunaria-eclipse.sh'
  'lunaria-light.sh'
  'maia.sh'
  'man-page.sh'
  'mar.sh'
  'material.sh'
  'mathias.sh'
  'medallion.sh'
  'misterioso.sh'
  'miu.sh'
  'molokai.sh'
  'mona-lisa.sh'
  'mono-amber.sh'
  'mono-cyan.sh'
  'mono-green.sh'
  'mono-red.sh'
  'mono-white.sh'
  'mono-yellow.sh'
  'monokai-dark.sh'
  'monokai-pro.sh'
  'monokai-pro-ristretto.sh'
  'monokai-soda.sh'
  'morada.sh'
  'n0tch2k.sh'
  'neon-night.sh'
  'neopolitan.sh'
  'nep.sh'
  'neutron.sh'
  'night-owl.sh'
  'nightlion-v1.sh'
  'nightlion-v2.sh'
  'nighty.sh'
  'nord-light.sh'
  'nord.sh'
  'novel.sh'
  'obsidian.sh'
  'ocean-dark.sh'
  'ocean.sh'
  'oceanic-next.sh'
  'ollie.sh'
  'omni.sh'
  'one-dark.sh'
  'one-half-black.sh'
  'one-light.sh'
  'palenight.sh'
  'pali.sh'
  'panda.sh'
  'papercolor-dark.sh'
  'papercolor-light.sh'
  'paraiso-dark.sh'
  'paul-millr.sh'
  'pencil-dark.sh'
  'pencil-light.sh'
  'peppermint.sh'
  'pixiefloss.sh'
  'pnevma.sh'
  'powershell.sh'
  'pro.sh'
  'purple-people-eater.sh'
  'red-alert.sh'
  'red-sands.sh'
  'relaxed.sh'
  'rippedcasts.sh'
  'royal.sh'
  'sat.sh'
  'sea-shells.sh'
  'seafoam-pastel.sh'
  'seti.sh'
  'shaman.sh'
  'shel.sh'
  'slate.sh'
  'smyck.sh'
  'snazzy.sh'
  'soft-server.sh'
  'solarized-darcula.sh'
  'solarized-dark-higher-contrast.sh'
  'solarized-dark.sh'
  'solarized-light.sh'
  'sonokai.sh'
  'spacedust.sh'
  'spacegray-eighties-dull.sh'
  'spacegray-eighties.sh'
  'spacegray.sh'
  'spring.sh'
  'square.sh'
  'srcery.sh'
  'summer-pop.sh'
  'sundried.sh'
  'sweet-eliverlara.sh'
  'sweet-terminal.sh'
  'symphonic.sh'
  'synthwave.sh'
  'teerb.sh'
  'tender.sh'
  'terminal-basic.sh'
  'terminix-dark.sh'
  'thayer-bright.sh'
  'tin.sh'
  'tokyo-night-light.sh'
  'tokyo-night-storm.sh'
  'tokyo-night.sh'
  'tomorrow-night-blue.sh'
  'tomorrow-night-bright.sh'
  'tomorrow-night-eighties.sh'
  'tomorrow-night.sh'
  'tomorrow.sh'
  'toy-chest.sh'
  'treehouse.sh'
  'twilight.sh'
  'ura.sh'
  'urple.sh'
  'vag.sh'
  'vaughn.sh'
  'vibrant-ink.sh'
  'vs-code-dark-plus.sh'
  'vs-code-light-plus.sh'
  'warm-neon.sh'
  'wez.sh'
  'wild-cherry.sh'
  'wombat.sh'
  'wryan.sh'
  'wzoreck.sh'
  'zenburn.sh'
)

# Allow developer to change url to forked url for easier testing
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}
PROGRESS_URL="https://raw.githubusercontent.com/phenonymous/shell-progressbar/1.0/progress.sh"

capitalize() {
  local ARGUMENT=$1
  local RES=""
  local STR=""
  local RES_NO_TRAIL_SPACE=""

  for CHAR in $ARGUMENT; do
    STR=$(echo "${CHAR:0:1}" | tr "[:lower:]" "[:upper:]")"${CHAR:1} "
    RES="${RES}${STR}"
    RES_NO_TRAIL_SPACE="$(echo -e "${RES}" | sed -e 's/[[:space:]]*$//')"
  done

  echo "${RES_NO_TRAIL_SPACE}"
}


set_gogh() {
  string=$1
  string_r="${string%???}"
  string_s=${string_r//\./_}
  result=$(capitalize "${string_s}")
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


# |
# | ::::::: Print logo
# |
tput clear
if [[ ${COLUMNS:-$(tput cols)} -ge 80 ]]; then
  gogh_str=""
  gogh_str+="                                                                                \n"
  gogh_str+="                    █████████                    █████                          \n"
  gogh_str+="                   ███     ███                    ███                           \n"
  gogh_str+="                  ███           ██████   ███████  ███████                       \n"
  gogh_str+="                  ███          ███  ███ ███  ███  ███  ███                      \n"
  gogh_str+="                  ███    █████ ███  ███ ███  ███  ███  ███                      \n"
  gogh_str+="                   ███    ███  ███  ███ ███  ███  ███  ███                      \n"
  gogh_str+="                    █████████   ██████   ███████ ████ █████                     \n"
  gogh_str+="    $(tput setaf 0)█████████$(tput setaf 1)█████████$(tput setaf 2)█████████$(tput setaf 3)█████████$(tput setaf 4)█████$(tput sgr 0)███$(tput setaf 4)█$(tput setaf 5)█████████$(tput setaf 6)█████████$(tput setaf 7)█████████    \n"
  gogh_str+="    $(tput setaf 0)█████████$(tput setaf 1)█████████$(tput setaf 2)█████████$(tput setaf 3)█████████$(tput sgr 0)███$(tput setaf 4)██$(tput sgr 0)███$(tput setaf 4)█$(tput setaf 5)█████████$(tput setaf 6)█████████$(tput setaf 7)█████████    \n"
  gogh_str+="    $(tput setaf 0)█████████$(tput setaf 1)█████████$(tput setaf 2)█████████$(tput setaf 3)█████████$(tput setaf 4)█$(tput sgr0)██████$(tput setaf 4)██$(tput setaf 5)█████████$(tput setaf 6)█████████$(tput setaf 7)█████████    \n"
  gogh_str+="    $(tput setaf 8)█████████$(tput setaf 9)█████████$(tput setaf 10)█████████$(tput setaf 11)█████████$(tput setaf 12)█████████$(tput setaf 13)█████████$(tput setaf 14)█████████$(tput setaf 15)█████████$(tput sgr 0)    \n"
  gogh_str+="    $(tput setaf 8)█████████$(tput setaf 9)█████████$(tput setaf 10)█████████$(tput setaf 11)█████████$(tput setaf 12)█████████$(tput setaf 13)█████████$(tput setaf 14)█████████$(tput setaf 15)█████████$(tput sgr 0)    \n"
  gogh_str+="    $(tput setaf 8)█████████$(tput setaf 9)█████████$(tput setaf 10)█████████$(tput setaf 11)█████████$(tput setaf 12)█████████$(tput setaf 13)█████████$(tput setaf 14)█████████$(tput setaf 15)█████████$(tput sgr 0)    \n"
  gogh_str+="                                                                                "


  printf '%b\n' "${gogh_str}"
  sleep 2.5
else
  echo -e "\nGogh\n"
  for c in {0..15}; do
    echo -n "$(tput setaf $c)█████$(tput sgr0)"
    [[ $c == 7 ]] && echo # new line
  done
  echo
fi


# |
# | ::::::: Print Themes
# |
echo -e "\nThemes:\n"

for TH in "${THEMES[@]}"; do

  KEY=$(printf "%02d" $NUM)
  FILENAME=${TH::$((${#TH}-3))}
  FILENAME_SPACE=${FILENAME//-/ }

  echo -e "    ($(tput setaf 4) $KEY $(tput sgr0)) $(capitalize "${FILENAME_SPACE}")"

  ((NUM++))

done
echo -e "    ($(tput setaf 4) ALL $(tput sgr0)) All themes"

# |
# | ::::::: Select Option
# |
echo -e "\nUsage : Enter Desired Themes Numbers ($(tput setaf 4)OPTIONS$(tput sgr0)) Separated By A Blank Space"
echo -e "        Press $(tput setaf 4)ENTER$(tput sgr0) without options to Exit\n"
read -r -p 'Enter OPTION(S) : ' -a OPTION

# Automagically generate options if user opts for all themes
[[ "$OPTION" == ALL ]] && OPTION=($(seq -s " " $ARRAYLENGTH))

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
  elif [[ "$TERM" = "xterm-kitty" ]]; then
    TERMINAL="kitty"
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


# |
# | ::::::: Export one-off variables
# |
[[ -n "${TILIX_RES:-}" ]] && export TILIX_RES
export TERMINAL LOOP OPTLENGTH=${#OPTION[@]}


# |
# | ::::::: Apply Theme
# |

declare color_dot_str
for c in {0..15}; do
  color_dot_str+="$(tput setaf $c)•$(tput sgr0)"
  [[ $c == 7 ]] && color_dot_str+=" "
done

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

    FILENAME=$(remove_file_extension "${THEMES[((OP-1))]}")
    FILENAME_SPACE="${FILENAME//-/ }"
    echo -e "\nTheme: $(capitalize "${FILENAME_SPACE}")"
    echo "${color_dot_str}"
    echo

    SET_THEME="${THEMES[((OP-1))]}"
    set_gogh "${SET_THEME}"
  else
    echo -e "$(tput setaf 1) ~ INVALID OPTION! ~$(tput sgr0)"
    exit 1
  fi
done
# If you skip || : and the command does not exist the script will exit with code 1
# this will always return exit code 0 if we got this far
command -v bar::stop > /dev/null && bar::stop || :
