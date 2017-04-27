#!/usr/bin/env bash

echo -e "
Gogh
\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
echo -e "
Themes:
    (\\e[0m\e[0;34m 01 \\e[0m\e[0m) aci
    (\\e[0m\e[0;34m 02 \\e[0m\e[0m) aco
    (\\e[0m\e[0;34m 03 \\e[0m\e[0m) azu
    (\\e[0m\e[0;34m 04 \\e[0m\e[0m) bim
    (\\e[0m\e[0;34m 05 \\e[0m\e[0m) cai
    (\\e[0m\e[0;34m 06 \\e[0m\e[0m) Chalk
    (\\e[0m\e[0;34m 07 \\e[0m\e[0m) Dracula
    (\\e[0m\e[0;34m 08 \\e[0m\e[0m) elementary
    (\\e[0m\e[0;34m 09 \\e[0m\e[0m) elic
    (\\e[0m\e[0;34m 10 \\e[0m\e[0m) elio
    (\\e[0m\e[0;34m 11 \\e[0m\e[0m) Flat
    (\\e[0m\e[0;34m 12 \\e[0m\e[0m) Freya
    (\\e[0m\e[0;34m 13 \\e[0m\e[0m) Gruvbox Dark
    (\\e[0m\e[0;34m 14 \\e[0m\e[0m) Hemisu Dark
    (\\e[0m\e[0;34m 15 \\e[0m\e[0m) Hemisu Light
    (\\e[0m\e[0;34m 16 \\e[0m\e[0m) Hybrid
    (\\e[0m\e[0;34m 17 \\e[0m\e[0m) jup
    (\\e[0m\e[0;34m 18 \\e[0m\e[0m) mar
    (\\e[0m\e[0;34m 19 \\e[0m\e[0m) Material Colors
    (\\e[0m\e[0;34m 20 \\e[0m\e[0m) miu
    (\\e[0m\e[0;34m 21 \\e[0m\e[0m) Monokai Dark
    (\\e[0m\e[0;34m 22 \\e[0m\e[0m) nep
    (\\e[0m\e[0;34m 23 \\e[0m\e[0m) Ocean Dark
    (\\e[0m\e[0;34m 24 \\e[0m\e[0m) One Dark
    (\\e[0m\e[0;34m 25 \\e[0m\e[0m) One Light
    (\\e[0m\e[0;34m 26 \\e[0m\e[0m) pali
    (\\e[0m\e[0;34m 27 \\e[0m\e[0m) Peppermint
    (\\e[0m\e[0;34m 28 \\e[0m\e[0m) sat
    (\\e[0m\e[0;34m 29 \\e[0m\e[0m) shel
    (\\e[0m\e[0;34m 30 \\e[0m\e[0m) Smyck
    (\\e[0m\e[0;34m 31 \\e[0m\e[0m) Solarized Dark
    (\\e[0m\e[0;34m 32 \\e[0m\e[0m) Solarized Light
    (\\e[0m\e[0;34m 33 \\e[0m\e[0m) tin
    (\\e[0m\e[0;34m 34 \\e[0m\e[0m) Tomorrow
    (\\e[0m\e[0;34m 35 \\e[0m\e[0m) Tomorrow Night
    (\\e[0m\e[0;34m 36 \\e[0m\e[0m) Tomorrow Night Blue
    (\\e[0m\e[0;34m 37 \\e[0m\e[0m) Tomorrow Night Bright
    (\\e[0m\e[0;34m 38 \\e[0m\e[0m) Tomorrow Night Eighties
    (\\e[0m\e[0;34m 39 \\e[0m\e[0m) ura
    (\\e[0m\e[0;34m 40 \\e[0m\e[0m) vag
"
echo -e "Usage : Enter Theme Number (\\e[0m\e[0;34mOPTION\\e[0m\e[0m)"
echo -n 'Enter OPTION :'
read NUM
case $NUM in
    0) echo '0 is not in OPTION' ;;

    1 | 01) echo 'Theme: aci'
    source ../themes/aci.sh;;

    2 | 02) echo 'Theme: aco'
    source ../themes/aco.sh;;

    3 | 03) echo 'Theme: azu'
    source ../themes/azu.sh;;

    4 | 04) echo 'Theme: bim'
    source ../themes/bim.sh;;

    5 | 05) echo 'Theme: cai'
    source ../themes/cai.sh;;

    6 | 06) echo 'Theme: Chalk'
    source ../themes/chalk.sh;;

    7 | 07) echo 'Theme: Dracula'
    source ../themes/dracula.sh;;

    8 | 08) echo 'Theme: elementary'
    source ../themes/elementary.sh;;

    9 | 09) echo 'Theme: elic'
    source ../themes/elic.sh;;

    10) echo 'Theme: elio'
    source ../themes/elio.sh;;

    11) echo 'Theme: Flat'
    source ../themes/flat.sh;;

    12) echo 'Theme: Freya'
    source ../themes/freya.sh;;

    13) echo 'Theme: Gruvbox Dark'
    source ../themes/gruvbox.dark.sh;;

    14) echo 'Theme: Hemisu Dark'
    source ../themes/hemisu.dark.sh;;

    15) echo 'Theme: Hemisu Light'
    source ../themes/hemisu.light.sh;;

    16) echo 'Theme: Hybrid'
    source ../themes/hybrid.sh;;

    17) echo 'Theme: jup'
    source ../themes/jup.sh;;

    18) echo 'Theme: mar'
    source ../themes/mar.sh;;

    19) echo 'Theme: Material Colors'
    source ../themes/material.sh;;

    20) echo 'Theme: miu'
    source ../themes/miu.sh;;

    21) echo 'Theme: Monokai Dark'
    source ../themes/monokai.dark.sh;;

    22) echo 'Theme: nep'
    source ../themes/nep.sh;;

    23) echo 'Theme: Ocean Dark'
    source ../themes/ocean.dark.sh;;

    24) echo 'Theme: One Dark     $'
    source ../themes/one.dark.sh;;

    25) echo 'Theme: One Light'
    source ../themes/one.light.sh;;

    26) echo 'Theme: pali'
    source ../themes/pali.sh;;

    27) echo 'Theme: Peppermint'
    source ../themes/peppermint.sh;;

    28) echo 'Theme: sat'
    source ../themes/sat.sh;;

    29) echo 'Theme: shel'
    source ../themes/shel.sh;;

    30) echo 'Theme: Smyck'
    source ../themes/smyck.sh;;

    31) echo 'Theme: Solarized Dark'
    source ../themes/solarized.dark.sh;;

    32) echo 'Theme: Solarized Light'
    source ../themes/solarized.light.sh;;

    33) echo 'Theme: tin'
    source ../themes/tin.sh;;

    34) echo 'Theme: Tomorrow'
    source ../themes/tomorrow.sh;;

    35) echo 'Theme: Tomorrow Night'
    source ../themes/tomorrow.night.sh;;

    36) echo 'Theme: Tomorrow Night Blue'
    source ../themes/tomorrow.night.blue.sh;;

    37) echo 'Theme: Tomorrow Night Bright'
    source ../themes/tomorrow.night.bright.sh;;

    38) echo 'Theme: Tomorrow Night Eighties'
    source ../themes/tomorrow.night.eighties.sh;;

    39) echo 'Theme: ura'
    source ../themes/ura.sh;;

    40) echo 'Theme: vag'
    source ../themes/vag.sh;;

    *) echo 'INVALID OPTION!' ;;
        esac
