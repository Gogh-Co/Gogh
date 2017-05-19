#!/usr/bin/env bash


function set_gogh () {    
    wget -O gogh https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/$1 && chmod +x gogh && ./gogh && rm gogh
}

echo -e "
Gogh
\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m
\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
echo -e "
Themes:
    (\\e[0m\e[0;31m 00  \\e[0m\e[0m) EXIT

    (\\e[0m\e[0;34m 01 \\e[0m\e[0m) Aci
    (\\e[0m\e[0;34m 02 \\e[0m\e[0m) Aco
    (\\e[0m\e[0;34m 03 \\e[0m\e[0m) Azu
    (\\e[0m\e[0;34m 04 \\e[0m\e[0m) Bim
    (\\e[0m\e[0;34m 05 \\e[0m\e[0m) Cai
    (\\e[0m\e[0;34m 06 \\e[0m\e[0m) Chalk
    (\\e[0m\e[0;34m 07 \\e[0m\e[0m) Dracula
    (\\e[0m\e[0;34m 08 \\e[0m\e[0m) Elementary
    (\\e[0m\e[0;34m 09 \\e[0m\e[0m) Elic
    (\\e[0m\e[0;34m 10 \\e[0m\e[0m) Elio
    (\\e[0m\e[0;34m 11 \\e[0m\e[0m) Flat
    (\\e[0m\e[0;34m 12 \\e[0m\e[0m) Freya
    (\\e[0m\e[0;34m 13 \\e[0m\e[0m) Gruvbox Dark
    (\\e[0m\e[0;34m 14 \\e[0m\e[0m) Hemisu Dark
    (\\e[0m\e[0;34m 15 \\e[0m\e[0m) Hemisu Light
    (\\e[0m\e[0;34m 16 \\e[0m\e[0m) Hybrid
    (\\e[0m\e[0;34m 17 \\e[0m\e[0m) Jup
    (\\e[0m\e[0;34m 18 \\e[0m\e[0m) Mar
    (\\e[0m\e[0;34m 19 \\e[0m\e[0m) Material
    (\\e[0m\e[0;34m 20 \\e[0m\e[0m) Miu
    (\\e[0m\e[0;34m 21 \\e[0m\e[0m) Monokai Dark
    (\\e[0m\e[0;34m 22 \\e[0m\e[0m) Nep
    (\\e[0m\e[0;34m 23 \\e[0m\e[0m) Nord Light
    (\\e[0m\e[0;34m 24 \\e[0m\e[0m) Nord
    (\\e[0m\e[0;34m 25 \\e[0m\e[0m) Ocean Dark
    (\\e[0m\e[0;34m 26 \\e[0m\e[0m) One Dark
    (\\e[0m\e[0;34m 27 \\e[0m\e[0m) One Light
    (\\e[0m\e[0;34m 28 \\e[0m\e[0m) Pali
    (\\e[0m\e[0;34m 29 \\e[0m\e[0m) Peppermint
    (\\e[0m\e[0;34m 30 \\e[0m\e[0m) Sat
    (\\e[0m\e[0;34m 31 \\e[0m\e[0m) Shel
    (\\e[0m\e[0;34m 32 \\e[0m\e[0m) Smyck
    (\\e[0m\e[0;34m 33 \\e[0m\e[0m) Solarized Dark
    (\\e[0m\e[0;34m 34 \\e[0m\e[0m) Solarized Light
    (\\e[0m\e[0;34m 35 \\e[0m\e[0m) Tin
    (\\e[0m\e[0;34m 36 \\e[0m\e[0m) Tomorrow Night Blue
    (\\e[0m\e[0;34m 37 \\e[0m\e[0m) Tomorrow Night Bright
    (\\e[0m\e[0;34m 38 \\e[0m\e[0m) Tomorrow Night Eighties
    (\\e[0m\e[0;34m 39 \\e[0m\e[0m) Tomorrow Night
    (\\e[0m\e[0;34m 40 \\e[0m\e[0m) Tomorrow
    (\\e[0m\e[0;34m 41 \\e[0m\e[0m) Ura
    (\\e[0m\e[0;34m 42 \\e[0m\e[0m) Vag
"
echo -e "Usage : Enter Desired Themes Numbers (\\e[0m\e[0;34mOPTIONS\\e[0m\e[0m) Separated By A Blank Space"
#echo -n 'Enter OPTION : '
#read NUM
read -p 'Enter OPTION(S) : ' -a array

for i in "${array[@]}"
do
    case $i in
        0) echo 'Exit' ;;

        1 | 01) echo 'Theme: Aci'
        SET_THEME="aci.sh"
        set_gogh "${SET_THEME}";;

        2 | 02) echo 'Theme: Aco'
        SET_THEME="aco.sh"
        set_gogh "${SET_THEME}";;

        3 | 03) echo 'Theme: Azu'
        SET_THEME="azu.sh"
        set_gogh "${SET_THEME}";;

        4 | 04) echo 'Theme: Bim'
        SET_THEME="bim.sh"
        set_gogh "${SET_THEME}";;

        5 | 05) echo 'Theme: Cai'
        SET_THEME="cai.sh"
        set_gogh "${SET_THEME}";;

        6 | 06) echo 'Theme: Chalk'
        SET_THEME="chalk.sh"
        set_gogh "${SET_THEME}";;

        7 | 07) echo 'Theme: Dracula'
        SET_THEME="dracula.sh"
        set_gogh "${SET_THEME}";;

        8 | 08) echo 'Theme: Elementary'
        SET_THEME="elementary.sh"
        set_gogh "${SET_THEME}";;

        9 | 09) echo 'Theme: Elic'
        SET_THEME="elic.sh"
        set_gogh "${SET_THEME}";;

        10) echo 'Theme: Elio'
        SET_THEME="elio.sh"
        set_gogh "${SET_THEME}";;

        11) echo 'Theme: Flat'
        SET_THEME="flat.sh"
        set_gogh "${SET_THEME}";;

        12) echo 'Theme: Freya'
        SET_THEME="freya.sh"
        set_gogh "${SET_THEME}";;

        13) echo 'Theme: Gruvbox Dark'
        SET_THEME="gruvbox.dark.sh"
        set_gogh "${SET_THEME}";;

        14) echo 'Theme: Hemisu Dark'
        SET_THEME="hemisu.dark.sh"
        set_gogh "${SET_THEME}";;

        15) echo 'Theme: Hemisu Light'
        SET_THEME="hemisu.light.sh"
        set_gogh "${SET_THEME}";;

        16) echo 'Theme: Hybrid'
        SET_THEME="hybrid.sh"
        set_gogh "${SET_THEME}";;

        17) echo 'Theme: Jup'
        SET_THEME="jup.sh"
        set_gogh "${SET_THEME}";;

        18) echo 'Theme: Mar'
        SET_THEME="mar.sh"
        set_gogh "${SET_THEME}";;

        19) echo 'Theme: Material Colors'
        SET_THEME="material.sh"
        set_gogh "${SET_THEME}";;

        20) echo 'Theme: Miu'
        SET_THEME="miu.sh"
        set_gogh "${SET_THEME}";;

        21) echo 'Theme: Monokai Dark'
        SET_THEME="monokai.dark.sh"
        set_gogh "${SET_THEME}";;

        22) echo 'Theme: Nep'
        SET_THEME="nep.sh"
        set_gogh "${SET_THEME}";;

        23) echo 'Theme: Nord Light'
        SET_THEME="nord.light.sh"
        set_gogh "${SET_THEME}";;

        24) echo 'Theme: Nord'
        SET_THEME="nord.sh"
        set_gogh "${SET_THEME}";;

        25) echo 'Theme: Ocean Dark'
        SET_THEME="ocean.dark.sh"
        set_gogh "${SET_THEME}";;

        26) echo 'Theme: One Dark'
        SET_THEME="one.dark.sh"
        set_gogh "${SET_THEME}";;

        27) echo 'Theme: One Light'
        SET_THEME="one.light.sh"
        set_gogh "${SET_THEME}";;

        28) echo 'Theme: Pali'
        SET_THEME="pali.sh"
        set_gogh "${SET_THEME}";;

        29) echo 'Theme: Peppermint'
        SET_THEME="peppermint.sh"
        set_gogh "${SET_THEME}";;

        30) echo 'Theme: Sat'
        SET_THEME="sat.sh"
        set_gogh "${SET_THEME}";;

        31) echo 'Theme: Shel'
        SET_THEME="shel.sh"
        set_gogh "${SET_THEME}";;

        32) echo 'Theme: Smyck'
        SET_THEME="smyck.sh"
        set_gogh "${SET_THEME}";;

        33) echo 'Theme: Solarized Dark'
        SET_THEME="solarized.dark.sh"
        set_gogh "${SET_THEME}";;

        34) echo 'Theme: Solarized Light'
        SET_THEME="solarized.light.sh"
        set_gogh "${SET_THEME}";;

        35) echo 'Theme: Tin'
        SET_THEME="tin.sh"
        set_gogh "${SET_THEME}";;

        36) echo 'Theme: Tomorrow Night Blue'
        SET_THEME="tomorrow.night.blue.sh"
        set_gogh "${SET_THEME}";;

        37) echo 'Theme: Tomorrow Night Bright'
        SET_THEME="tomorrow.night.bright.sh"
        set_gogh "${SET_THEME}";;

        38) echo 'Theme: Tomorrow Night Eighties'
        SET_THEME="tomorrow.night.eighties.sh"
        set_gogh "${SET_THEME}";;

        39) echo 'Theme: Tomorrow Night'
        SET_THEME="tomorrow.night.sh"
        set_gogh "${SET_THEME}";;

        40) echo 'Theme: Tomorrow'
        SET_THEME="tomorrow.sh"
        set_gogh "${SET_THEME}";;

        41) echo 'Theme: Ura'
        SET_THEME="ura.sh"
        set_gogh "${SET_THEME}";;

        42) echo 'Theme: Vag'
        SET_THEME="vag.sh"
        set_gogh "${SET_THEME}";;

        *) echo 'INVALID OPTION!' ;;
    esac
done
