#!/usr/bin/env bash

declare -a THEMES=(
    'aci.sh'
    'aco.sh'
    'azu.sh'
    'bim.sh'
    'cai.sh'
    'chalk.sh'
    'dracula.sh'
    'elementary.sh'
    'elic.sh'
    'elio.sh'
    'flat.sh'
    'freya.sh'
    'gruvbox-dark.sh'
    'hemisu-dark.sh'
    'hemisu-light.sh'
    'hybrid.sh'
    'ir-black.sh'
    'jup.sh'
    'mar.sh'
    'material.sh'
    'miu.sh'
    'monokai-dark.sh'
    'nep.sh'
    'nord-light.sh'
    'nord.sh'
    'ocean-dark.sh'
    'one-dark.sh'
    'one-light.sh'
    'pali.sh'
    'peppermint.sh'
    'sat.sh'
    'shel.sh'
    'smyck.sh'
    'solarized-dark.sh'
    'solarized-light.sh'
    'tin.sh'
    'tomorrow-night-blue.sh'
    'tomorrow-night-bright.sh'
    'tomorrow-night-eighties.sh'
    'tomorrow-night.sh'
    'tomorrow.sh'
    'ura.sh'
    'vag.sh'
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

    if [[ $OP<$ARRAYLENGTH ]]; then
        echo "Theme: ${FILENAME_SPACE^}"
        SET_THEME="${THEMES[(($OP-1))]}"
        set_gogh "${SET_THEME}"
        exit 1
    else
        echo -e "\\e[0m\e[0;31m ~ INVALID OPTION! ~\\e[0m\e[0m"
        exit 1
    fi

done
