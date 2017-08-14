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
    'chalkboard.sh'
    'chalk.sh'
    'ciapre.sh'
    'clrs.sh'
    'cobalt2.sh'
    'cobalt-neon.sh'
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
    'flatland.sh'
    'flat.sh'
    'freya.sh'
    'frontend-delight.sh'
    'frontend-fun-forrest.sh'
    'frontend-galaxy.sh'
    'github.sh'
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
    'liquid-carbon.sh'
    'liquid-carbon-transparent.sh'
    'man-page.sh'
    'mar.sh'
    'material.sh'
    'mathias.sh'
    'medallion.sh'
    'misterioso.sh'
    'miu.sh'
    'molokai.sh'
    'monalisa.sh'
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
    'oceanic-next.sh'
    'ocean.sh'
    'ollie.sh'
    'one-dark.sh'
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
    'seafoam-pastel.sh'
    'sea-shells.sh'
    'seti.sh'
    'shaman.sh'
    'shel.sh'
    'slate.sh'
    'smyck.sh'
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
    'sundried.sh'
    'symphonic.sh'
    'teerb.sh'
    'terminal-basic.sh'
    'terminix-dark.sh'
    'thayer-bright.sh'
    'tin.sh'
    'tomorrow-night.sh'
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

set_gogh () {
    string=$1
    string_r="${string%???}"
    string_s=${string_r//\./_}
    result="${string_s^}"
    export {PROFILE_NAME,PROFILE_SLUG}=$result && wget -O gogh https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/$1 && chmod +x gogh && ./gogh && rm gogh
}

### Get length of an array
ARRAYLENGTH=${#THEMES[@]}
NUM=1

# |
# | ::::::: Print Colors
# |
echo -e "
Gogh
\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m
\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"

# |
# | ::::::: Print Themes
# |
echo -e "
Themes:
    (\\e[0m\e[0;34m 00 \\e[0m\e[0m) EXIT
    "

for TH in "${THEMES[@]}"; do

    KEY=$(printf "%02d" $NUM)
    FILENAME=${TH::-3}
    FILENAME_SPACE=${FILENAME//-/ }

    echo -e "    (\\e[0m\e[0;34m $KEY \\e[0m\e[0m) ${FILENAME_SPACE^}"

    ((NUM++))

done

# |
# | ::::::: Select Option
# |
echo -e "Usage : Enter Desired Themes Numbers (\\e[0m\e[0;34mOPTIONS\\e[0m\e[0m) Separated By A Blank Space"

read -p 'Enter OPTION(S) : ' -a OPTION


# |
# | ::::::: Apply Theme
# |
for OP in "${OPTION[@]}"; do

    if (( OP < ARRAYLENGTH )); then
        FILENAME="${THEMES[((OP-1))]::-3}"
        FILENAME_SPACE="${FILENAME//-/ }"
        echo "Theme: ${FILENAME_SPACE^}"
        SET_THEME="${THEMES[((OP-1))]}"
        set_gogh "${SET_THEME}"
    else
        echo -e "\\e[0m\e[0;31m ~ INVALID OPTION! ~\\e[0m\e[0m"
        exit 1
    fi

done
