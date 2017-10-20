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
    'foxnightly.sh'
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

capitalize (){
    RES=""
    for str in $1; do Str=`echo "${str:0:1}" | tr "[:lower:]" "[:upper:]"`"${str:1} "; RES="${RES}${Str}"; done
    echo "${RES}"
}

set_gogh () {
    string=$1
    string_r="${string%???}"
    string_s=${string_r//\./_}
	result=$(capitalize "${string_s}")
	
	if [ $(uname) = "Darwin" ]; then
		# OSX ships with curl
		# Note: sourcing directly from curl does not work
        export {PROFILE_NAME,PROFILE_SLUG}=$result && curl -fLo gogh https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/$1 && source gogh && rm gogh
	else
        export {PROFILE_NAME,PROFILE_SLUG}=$result && source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/$1)
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
		echo "Theme: $(capitalize "${FILENAME_SPACE}")"
        SET_THEME="${THEMES[((OP-1))]}"
        set_gogh "${SET_THEME}"
    else
        echo -e "\\033[0m\033[0;31m ~ INVALID OPTION! ~\\033[0m\033[0m"
        exit 1
    fi

done
