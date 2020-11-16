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
  'azu.sh'
  'belafonte-day.sh'
  'belafonte-night.sh'
  'bim.sh'
  'birds-of-paradise.sh'
  'blazer.sh'
  'bluloco-light.sh'
  'borland.sh'
  'broadcast.sh'
  'brogrammer.sh'
  'c64.sh'
  'cai.sh'
  'chalk.sh'
  'chalkboard.sh'
  'ciapre.sh'
  'clone-of-ubuntu.sh'
  'clrs.sh'
  'cobalt-neon.sh'
  'cobalt2.sh'
  'crayon-pony-fish.sh'
  'dark-pastel.sh'
  'darkside.sh'
  'desert.sh'
  'dimmed-monokai.sh'
  'dracula.sh'
  'earthsong.sh'
  'elemental.sh'
  'elementary.sh'
  'elic.sh'
  'elio.sh'
  'espresso-libre.sh'
  'espresso.sh'
  'fishtank.sh'
  'flat.sh'
  'flatland.sh'
  'foxnightly.sh'
  'freya.sh'
  'frontend-delight.sh'
  'frontend-fun-forrest.sh'
  'frontend-galaxy.sh'
  'github.sh'
  'geohot.sh'
  'gooey.sh'
  'google-dark.sh'
  'google-light.sh'
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
  'hurtado.sh'
  'hybrid.sh'
  'ic-green-ppl.sh'
  'ic-orange-ppl.sh'
  'idle-toes.sh'
  'ir-black.sh'
  'jackie-brown.sh'
  'japanesque.sh'
  'jellybeans.sh'
  'jup.sh'
  'kibble.sh'
  'later-this-evening.sh'
  'lavandula.sh'
  'liquid-carbon-transparent.sh'
  'liquid-carbon.sh'
  'man-page.sh'
  'mar.sh'
  'material.sh'
  'mathias.sh'
  'medallion.sh'
  'misterioso.sh'
  'miu.sh'
  'molokai.sh'
  'mona-lisa.sh'
  'monokai-dark.sh'
  'monokai-soda.sh'
  'n0tch2k.sh'
  'neopolitan.sh'
  'nep.sh'
  'neutron.sh'
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
  'pali.sh'
  'panda.sh'
  'paraiso-dark.sh'
  'paul-millr.sh'
  'pencil-dark.sh'
  'pencil-light.sh'
  'peppermint.sh'
  'pnevma.sh'
  'pro.sh'
  'red-alert.sh'
  'red-sands.sh'
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
  'spacedust.sh'
  'spacegray-eighties-dull.sh'
  'spacegray-eighties.sh'
  'spacegray.sh'
  'spring.sh'
  'square.sh'
  'srcery.sh'
  'sundried.sh'
  'sweet.sh'
  'symphonic.sh'
  'teerb.sh'
  'terminal-basic.sh'
  'terminix-dark.sh'
  'thayer-bright.sh'
  'tin.sh'
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
  'warm-neon.sh'
  'wez.sh'
  'wild-cherry.sh'
  'wombat.sh'
  'wryan.sh'
  'wzoreck.sh'
  'zenburn.sh'
  )

# Allow developer to change url to forked url for easier testing
# IMPORTANT: Make sure you export this variable if your main shell is not bash
BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}
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
