#!/usr/bin/env bash

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
    'google-dark.sh'
    'google-light.sh'
    'gooey.sh'
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
    'one-dark.sh'
    'one-half-black.sh'
    'one-light.sh'
    'pali.sh'
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
    'zenburn.sh'
)


cleanup() {
  echo
  echo "Cleaning up"
  rm -rf "$scratchdir"
  unset TERMINAL LOOP OPTLENGTH
  echo "Done..."
  exit 0
}

scratchdir=$(mktemp -d -t tmp.XXXXXXXX)
export scratchdir
trap 'cleanup; trap - EXIT' EXIT HUP INT QUIT PIPE TERM


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
    string=$1
    string_r="${string%???}"
    string_s=${string_r//\./_}
    result=$(capitalize "${string_s}")
    url="https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/$1"

    export {PROFILE_NAME,PROFILE_SLUG}="$result"

    # Evaluate if Gogh was called from local source - i.e cloned repo
    SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    if [ -e "$SCRIPT_PATH/themes/$1" ]; then
        bash "$SCRIPT_PATH/themes/$1"
    else
      if [ "$(uname)" = "Darwin" ]; then
          # OSX ships with curl
          (eval "$(curl -sLo- "${url}")")
      else
          # Linux ships with wget
          (eval "$(wget -qO- "${url}")")
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
# | ::::::: Print Colors
# |
echo -e "
Gogh\n
\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m
\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"

# |
# | ::::::: Print Themes
# |
echo -e "\nThemes:\n"

for TH in "${THEMES[@]}"; do

    KEY=$(printf "%02d" $NUM)
    FILENAME=${TH::$((${#TH}-3))}
    FILENAME_SPACE=${FILENAME//-/ }

    echo -e "    (\\033[0m\033[0;34m $KEY \\033[0m\033[0m) $(capitalize "${FILENAME_SPACE}")"

    ((NUM++))

done

# |
# | ::::::: Select Option
# |
echo -e "\nUsage : Enter Desired Themes Numbers (\\033[0m\033[0;34mOPTIONS\\033[0m\033[0m) Separated By A Blank Space"
echo -e "        Press \033[0;34mENTER\\033[0m without options to Exit\n"
read -r -p 'Enter OPTION(S) : ' -a OPTION


# |
# | ::::::: Get terminal
# |
# |
# | Check for the terminal name (depening on os)
# | ===========================================
OS=$(uname)
if [ "$OS" = "Darwin" ]; then
    # |
    # | Check for the terminal name and decide how to apply
    # | ===========================================
    TERMINAL=$TERM_PROGRAM
elif [ "${OS#CYGWIN}" != "${OS}" ]; then
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

# |
# | Tilix supports fg/bg in color schemes - ask wether user wants to go that route
# | This is to avoid creating multiple profiles just for colors
# | ===========================================
if [[ "$TERMINAL" = "tilix" ]]; then
    echo
    read -r -p "Tilix detected - use color schemes instead of profiles? [y/N] " -n 1 TILIX_RES
    echo
fi

# |
# | If terminal supports truecolor then we can show theme colors without applying the theme
# | ===========================================
if [[ "${COLORTERM:-}" == "truecolor" ]] || [[ "${COLORTERM:-}" == "24bit" ]]; then
    # This function gets called in apply-colors.sh instead of gogh_colors
    # Calls to gogh_colors has also been move to apply-colors.sh to avoid printing twice
    function gogh_truecolor () {
      # Note: {01..16} does not work on OSX
      for c in $(seq -s " " -w 16); do
        local color="COLOR_$c"
        set -- $(hexRGBtoDecRGB "${!color}")
        echo -ne "\033[38;2;${1};${2};${3}m█████\033[0m"
        [[ "$c" == "08" ]] && echo # new line
      done
      echo -e "\n\n"
    }
    export -f gogh_truecolor
fi

# |
# | ::::::: Export one-off variables
# |
[[ -n "${TILIX_RES:-}" ]] && export TILIX_RES
export TERMINAL LOOP OPTLENGTH=${#OPTION[@]}

# |
# | ::::::: Apply Theme
# |

  # Note:
  # Constants with a leading 0 are interpreted as octal numbers
  # Hence option 08 and 09 will not work
  # Solution is to remove the leading 0 from the parsed options
for OP in "${OPTION[@]#0}"; do
    # See Tilix section in apply-colors.sh for usage of LOOP
    LOOP=$((${LOOP:-0}+1))
    if [[ OP -le ARRAYLENGTH && OP -gt 0 ]]; then

        FILENAME=$(remove_file_extension "${THEMES[((OP-1))]}")
        FILENAME_SPACE="${FILENAME//-/ }"
        echo -e "\nTheme: $(capitalize "${FILENAME_SPACE}")\n\033[0;30m•\\033[0m\033[0;31m•\\033[0m\033[0;32m•\\033[0m\033[0;33m•\\033[0m\033[0;34m•\\033[0m\033[0;35m•\\033[0m\033[0;36m•\\033[0m\033[0;37m•\\033[0m \033[0;37m•\\033[0m\033[0;36m•\\033[0m\033[0;35m•\\033[0m\033[0;34m•\\033[0m\033[0;33m•\\033[0m\033[0;32m•\\033[0m\033[0;31m•\\033[0m\033[0;30m•\\033[0m\n"

        SET_THEME="${THEMES[((OP-1))]}"
        set_gogh "${SET_THEME}"
    else
        echo -e "\\033[0m\033[0;31m ~ INVALID OPTION! ~\\033[0m\033[0m"
        exit 1
    fi
done
