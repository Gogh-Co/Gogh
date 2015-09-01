#!/bin/bash

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
    (\\e[0m\e[0;34m 13 \\e[0m\e[0m) Hemisu Dark
    (\\e[0m\e[0;34m 14 \\e[0m\e[0m) Hemisu Light
    (\\e[0m\e[0;34m 15 \\e[0m\e[0m) Hybrid
    (\\e[0m\e[0;34m 16 \\e[0m\e[0m) jup
    (\\e[0m\e[0;34m 17 \\e[0m\e[0m) mar
    (\\e[0m\e[0;34m 18 \\e[0m\e[0m) Material Colors
    (\\e[0m\e[0;34m 19 \\e[0m\e[0m) miu
    (\\e[0m\e[0;34m 20 \\e[0m\e[0m) Monokai Dark
    (\\e[0m\e[0;34m 21 \\e[0m\e[0m) nep
    (\\e[0m\e[0;34m 22 \\e[0m\e[0m) Ocean Dark
    (\\e[0m\e[0;34m 23 \\e[0m\e[0m) One Dark
    (\\e[0m\e[0;34m 24 \\e[0m\e[0m) One Light
    (\\e[0m\e[0;34m 25 \\e[0m\e[0m) pali
    (\\e[0m\e[0;34m 26 \\e[0m\e[0m) Peppermint
    (\\e[0m\e[0;34m 27 \\e[0m\e[0m) sat
    (\\e[0m\e[0;34m 28 \\e[0m\e[0m) shel
    (\\e[0m\e[0;34m 29 \\e[0m\e[0m) Smyck
    (\\e[0m\e[0;34m 30 \\e[0m\e[0m) Solarized Dark
    (\\e[0m\e[0;34m 31 \\e[0m\e[0m) Solarized Light
    (\\e[0m\e[0;34m 32 \\e[0m\e[0m) tin
    (\\e[0m\e[0;34m 33 \\e[0m\e[0m) Tomorrow
    (\\e[0m\e[0;34m 34 \\e[0m\e[0m) Tomorrow Night
    (\\e[0m\e[0;34m 35 \\e[0m\e[0m) Tomorrow Night Blue
    (\\e[0m\e[0;34m 36 \\e[0m\e[0m) Tomorrow Night Bright
    (\\e[0m\e[0;34m 37 \\e[0m\e[0m) Tomorrow Night Eighties
    (\\e[0m\e[0;34m 38 \\e[0m\e[0m) ura
    (\\e[0m\e[0;34m 39 \\e[0m\e[0m) vag
"
echo -e "Usage : Enter Theme Number (\\e[0m\e[0;34mOPTION\\e[0m\e[0m)"
echo -n 'Enter OPTION : '
read NUM
case $NUM in
    0) echo '0 is not in OPTION' ;;

    1 | 01) echo 'Thme: aci     '
    wget -O xt  http://git.io/v3Dlm && chmod +x xt && ./xt && rm xt;;

    2 | 02) echo 'Thme: aco     '
    wget -O xt  http://git.io/v3Dll && chmod +x xt && ./xt && rm xt;;

    3 | 03) echo 'Thme: azu     '
    wget -O xt  http://git.io/v3Dlz && chmod +x xt && ./xt && rm xt;;

    4 | 04) echo 'Thme: bim     '
    wget -O xt  http://git.io/v3Dlr && chmod +x xt && ./xt && rm xt;;

    5 | 05) echo 'Thme: cai     '
    wget -O xt  http://git.io/v3Dli && chmod +x xt && ./xt && rm xt;;

    6 | 06) echo 'Thme: Chalk     '
    wget -O xt  http://git.io/v3Dlb && chmod +x xt && ./xt && rm xt;;

    7 | 07) echo 'Thme: Dracula     '
    wget -O xt  http://git.io/v3D8e && chmod +x xt && ./xt && rm xt;;

    8 | 08) echo 'Thme: elementary     '
    wget -O xt  http://git.io/v3D8R && chmod +x xt && ./xt && rm xt;;

    9 | 09) echo 'Thme: elic     '
    wget -O xt  http://git.io/v3D82 && chmod +x xt && ./xt && rm xt;;

    10) echo 'Thme: elio     '
    wget -O xt  http://git.io/v3D44 && chmod +x xt && ./xt && rm xt;;

    11) echo 'Thme: Flat     '
    wget -O xt  http://git.io/v3D4z && chmod +x xt && ./xt && rm xt;;

    12) echo 'Thme: Freya     '
    wget -O xt  http://git.io/v3D4o && chmod +x xt && ./xt && rm xt;;

    13) echo 'Thme: Hemisu Dark     '
    wget -O xt  http://git.io/v3D4M && chmod +x xt && ./xt && rm xt;;

    14) echo 'Thme: Hemisu Light     '
    wget -O xt  http://git.io/v3D49 && chmod +x xt && ./xt && rm xt;;

    15) echo 'Thme: Hybrid     '
    wget -O xt  http://git.io/v3D4d && chmod +x xt && ./xt && rm xt;;

    16) echo 'Thme: jup     '
    wget -O xt  http://git.io/v3D4N && chmod +x xt && ./xt && rm xt;;

    17) echo 'Thme: mar     '
    wget -O xt  http://git.io/v3DBe && chmod +x xt && ./xt && rm xt;;

    18) echo 'Thme: Material Colors     '
    wget -O xt  http://git.io/v3DBv && chmod +x xt && ./xt && rm xt;;

    19) echo 'Thme: miu     '
    wget -O xt  http://git.io/v3DBT && chmod +x xt && ./xt && rm xt;;

    20) echo 'Thme: Monokai Dark     '
    wget -O xt  http://git.io/v3DBO && chmod +x xt && ./xt && rm xt;;

    21) echo 'Thme: nep     '
    wget -O xt  http://git.io/v3DBB && chmod +x xt && ./xt && rm xt;;

    22) echo 'Thme: Ocean Dark     '
    wget -O xt  http://git.io/v3DBz && chmod +x xt && ./xt && rm xt;;

    23) echo 'Thme: One Dark     $ '
    wget -O xt  http://git.io/vs7Ut && chmod +x xt && ./xt && rm xt;;

    24) echo 'Thme: One Light     '
    wget -O xt  http://git.io/vs7UQ && chmod +x xt && ./xt && rm xt;;

    25) echo 'Thme: pali     '
    wget -O xt  http://git.io/v3DBV && chmod +x xt && ./xt && rm xt;;

    26) echo 'Thme: Peppermint     '
    wget -O xt  http://git.io/v3DBK && chmod +x xt && ./xt && rm xt;;

    27) echo 'Thme: sat     '
    wget -O xt  http://git.io/v3DBP && chmod +x xt && ./xt && rm xt;;

    28) echo 'Thme: shel     '
    wget -O xt  http://git.io/v3DBM && chmod +x xt && ./xt && rm xt;;

    29) echo 'Thme: Smyck     '
    wget -O xt  http://git.io/v3DB9 && chmod +x xt && ./xt && rm xt;;

    30) echo 'Thme: Solarized Dark     '
    wget -O xt  http://git.io/v3DBQ && chmod +x xt && ./xt && rm xt;;

    31) echo 'Thme: Solarized Light     '
    wget -O xt  http://git.io/v3DB5 && chmod +x xt && ./xt && rm xt;;

    32) echo 'Thme: tin     '
    wget -O xt  http://git.io/v3DBF && chmod +x xt && ./xt && rm xt;;

    33) echo 'Thme: Tomorrow     '
    wget -O xt  http://git.io/v3DRc && chmod +x xt && ./xt && rm xt;;

    34) echo 'Thme: Tomorrow Night     '
    wget -O xt  http://git.io/v3DRs && chmod +x xt && ./xt && rm xt;;

    35) echo 'Thme: Tomorrow Night Blue     '
    wget -O xt  http://git.io/v3DBj && chmod +x xt && ./xt && rm xt;;

    36) echo 'Thme: Tomorrow Night Bright     '
    wget -O xt  http://git.io/v3DRJ && chmod +x xt && ./xt && rm xt;;

    37) echo 'Thme: Tomorrow Night Eighties     '
    wget -O xt  http://git.io/v3DRI && chmod +x xt && ./xt && rm xt;;

    38) echo 'Thme: ura     '
    wget -O xt  http://git.io/v3DRB && chmod +x xt && ./xt && rm xt;;

    39) echo 'Thme: vag     '
    wget -O xt  http://git.io/v3DR0 && chmod +x xt && ./xt && rm xt;;

    *) echo 'INVALID OPTION!' ;;
        esac
