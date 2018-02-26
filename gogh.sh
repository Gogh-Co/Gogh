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

curlsource() {
    local F=$(mktemp -t curlsource)
    curl -o "$F" -s -L "$1"
    source "$F"
    rm -f "$F"
}

set_gogh() {
    string=$1
    string_r="${string%???}"
    string_s=${string_r//\./_}
    result=$(capitalize "${string_s}")
    url="https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/$1"

    if [ "$(uname)" = "Darwin" ]; then
        # OSX ships with curl
        # Note: sourcing directly from curl does not work
        export {PROFILE_NAME,PROFILE_SLUG}="$result" && curlsource "${url}"
    else
        export {PROFILE_NAME,PROFILE_SLUG}="$result" && source <(wget -O - "${url}")
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
read -p 'Enter OPTION(S) : ' -a OPTION


# |
# | ::::::: Apply Theme
# |
for OP in "${OPTION[@]}"; do

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
