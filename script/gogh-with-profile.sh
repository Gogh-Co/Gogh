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
echo -e "Usage : Enter Desired Themes Numbers (\\e[0m\e[0;34mOPTIONS\\e[0m\e[0m) Separated By A Blank Space"
#echo -n 'Enter OPTION : '
#read NUM
read -p 'Enter OPTION(S) : ' -a array

for i in "${array[@]}"
do
    case $i in
        0) echo '0 is not in OPTION' ;;

        1 | 01) echo 'Theme: aci'
        export {PROFILE_NAME,PROFILE_SLUG}='aci' && wget -O xt http://git.io/v3Dlm && chmod +x xt && ./xt && rm xt;;

        2 | 02) echo 'Theme: aco'
        export {PROFILE_NAME,PROFILE_SLUG}='aco' && wget -O xt http://git.io/v3Dll && chmod +x xt && ./xt && rm xt;;

        3 | 03) echo 'Theme: azu'
        export {PROFILE_NAME,PROFILE_SLUG}='azu' && wget -O xt http://git.io/v3Dlz && chmod +x xt && ./xt && rm xt;;

        4 | 04) echo 'Theme: bim'
        export {PROFILE_NAME,PROFILE_SLUG}='bim' && wget -O xt http://git.io/v3Dlr && chmod +x xt && ./xt && rm xt;;

        5 | 05) echo 'Theme: cai'
        export {PROFILE_NAME,PROFILE_SLUG}='cai' && wget -O xt http://git.io/v3Dli && chmod +x xt && ./xt && rm xt;;

        6 | 06) echo 'Theme: Chalk'
        export {PROFILE_NAME,PROFILE_SLUG}='Chalk' && wget -O xt http://git.io/v3Dlb && chmod +x xt && ./xt && rm xt;;

        7 | 07) echo 'Theme: Dracula'
        export {PROFILE_NAME,PROFILE_SLUG}='Dracula' && wget -O xt http://git.io/v3D8e && chmod +x xt && ./xt && rm xt;;

        8 | 08) echo 'Theme: elementary'
        export {PROFILE_NAME,PROFILE_SLUG}='elementary' && wget -O xt http://git.io/v3D8R && chmod +x xt && ./xt && rm xt;;

        9 | 09) echo 'Theme: elic'
        export {PROFILE_NAME,PROFILE_SLUG}='elic' && wget -O xt http://git.io/v3D82 && chmod +x xt && ./xt && rm xt;;

        10) echo 'Theme: elio'
        export {PROFILE_NAME,PROFILE_SLUG}='elio' && wget -O xt http://git.io/v3D44 && chmod +x xt && ./xt && rm xt;;

        11) echo 'Theme: Flat'
        export {PROFILE_NAME,PROFILE_SLUG}='Flat' && wget -O xt http://git.io/v3D4z && chmod +x xt && ./xt && rm xt;;

        12) echo 'Theme: Freya'
        export {PROFILE_NAME,PROFILE_SLUG}='Freya' && wget -O xt http://git.io/v3D4o && chmod +x xt && ./xt && rm xt;;

        13) echo 'Theme: Gruvbox Dark'
        export {PROFILE_NAME,PROFILE_SLUG}='GruvboxDark' && wget -O xt http://git.io/v6JYg && chmod +x xt && ./xt && rm xt;;

        14) echo 'Theme: Hemisu Dark'
        export {PROFILE_NAME,PROFILE_SLUG}='HemisuDark' && wget -O xt http://git.io/v3D4M && chmod +x xt && ./xt && rm xt;;

        15) echo 'Theme: Hemisu Light'
        export {PROFILE_NAME,PROFILE_SLUG}='HemisuLight' && wget -O xt http://git.io/v3D49 && chmod +x xt && ./xt && rm xt;;

        16) echo 'Theme: Hybrid'
        export {PROFILE_NAME,PROFILE_SLUG}='Hybrid' && wget -O xt http://git.io/v3D4d && chmod +x xt && ./xt && rm xt;;

        17) echo 'Theme: jup'
        export {PROFILE_NAME,PROFILE_SLUG}='jup' && wget -O xt http://git.io/v3D4N && chmod +x xt && ./xt && rm xt;;

        18) echo 'Theme: mar'
        export {PROFILE_NAME,PROFILE_SLUG}='mar' && wget -O xt http://git.io/v3DBe && chmod +x xt && ./xt && rm xt;;

        19) echo 'Theme: Material Colors'
        export {PROFILE_NAME,PROFILE_SLUG}='MaterialColors' && wget -O xt http://git.io/v3DBv && chmod +x xt && ./xt && rm xt;;

        20) echo 'Theme: miu'
        export {PROFILE_NAME,PROFILE_SLUG}='miu' && wget -O xt http://git.io/v3DBT && chmod +x xt && ./xt && rm xt;;

        21) echo 'Theme: Monokai Dark'
        export {PROFILE_NAME,PROFILE_SLUG}='MonokaiDark' && wget -O xt http://git.io/v3DBO && chmod +x xt && ./xt && rm xt;;

        22) echo 'Theme: nep'
        export {PROFILE_NAME,PROFILE_SLUG}='nep' && wget -O xt http://git.io/v3DBB && chmod +x xt && ./xt && rm xt;;

        23) echo 'Theme: Ocean Dark'
        export {PROFILE_NAME,PROFILE_SLUG}='OceanDark' && wget -O xt http://git.io/v3DBz && chmod +x xt && ./xt && rm xt;;

        24) echo 'Theme: One Dark     $ '
        export {PROFILE_NAME,PROFILE_SLUG}='OneDark' && wget -O xt http://git.io/vs7Ut && chmod +x xt && ./xt && rm xt;;

        25) echo 'Theme: One Light'
        export {PROFILE_NAME,PROFILE_SLUG}='OneLight' && wget -O xt http://git.io/vs7UQ && chmod +x xt && ./xt && rm xt;;

        26) echo 'Theme: pali'
        export {PROFILE_NAME,PROFILE_SLUG}='pali' && wget -O xt http://git.io/v3DBV && chmod +x xt && ./xt && rm xt;;

        27) echo 'Theme: Peppermint'
        export {PROFILE_NAME,PROFILE_SLUG}='Peppermint' && wget -O xt http://git.io/v3DBK && chmod +x xt && ./xt && rm xt;;

        28) echo 'Theme: sat'
        export {PROFILE_NAME,PROFILE_SLUG}='sat' && wget -O xt http://git.io/v3DBP && chmod +x xt && ./xt && rm xt;;

        29) echo 'Theme: shel'
        export {PROFILE_NAME,PROFILE_SLUG}='shel' && wget -O xt http://git.io/v3DBM && chmod +x xt && ./xt && rm xt;;

        30) echo 'Theme: Smyck'
        export {PROFILE_NAME,PROFILE_SLUG}='Smyck' && wget -O xt http://git.io/v3DB9 && chmod +x xt && ./xt && rm xt;;

        31) echo 'Theme: Solarized Dark'
        export {PROFILE_NAME,PROFILE_SLUG}='SolarizedDark' && wget -O xt http://git.io/v3DBQ && chmod +x xt && ./xt && rm xt;;

        32) echo 'Theme: Solarized Light'
        export {PROFILE_NAME,PROFILE_SLUG}='SolarizedLight' && wget -O xt http://git.io/v3DB5 && chmod +x xt && ./xt && rm xt;;

        33) echo 'Theme: tin'
        export {PROFILE_NAME,PROFILE_SLUG}='tin' && wget -O xt http://git.io/v3DBF && chmod +x xt && ./xt && rm xt;;

        34) echo 'Theme: Tomorrow'
        export {PROFILE_NAME,PROFILE_SLUG}='Tomorrow' && wget -O xt http://git.io/v3DRc && chmod +x xt && ./xt && rm xt;;

        35) echo 'Theme: Tomorrow Night'
        export {PROFILE_NAME,PROFILE_SLUG}='TomorrowNight' && wget -O xt http://git.io/v3DRs && chmod +x xt && ./xt && rm xt;;

        36) echo 'Theme: Tomorrow Night Blue'
        export {PROFILE_NAME,PROFILE_SLUG}='TomorrowNightBlue' && wget -O xt http://git.io/v3DBj && chmod +x xt && ./xt && rm xt;;

        37) echo 'Theme: Tomorrow Night Bright'
        export {PROFILE_NAME,PROFILE_SLUG}='TomorrowNightBright' && wget -O xt http://git.io/v3DRJ && chmod +x xt && ./xt && rm xt;;

        38) echo 'Theme: Tomorrow Night Eighties'
        export {PROFILE_NAME,PROFILE_SLUG}='TomorrowNightEighties' && wget -O xt http://git.io/v3DRI && chmod +x xt && ./xt && rm xt;;

        39) echo 'Theme: ura'
        export {PROFILE_NAME,PROFILE_SLUG}='ura' && wget -O xt http://git.io/v3DRB && chmod +x xt && ./xt && rm xt;;

        40) echo 'Theme: vag'
        export {PROFILE_NAME,PROFILE_SLUG}='vag' && wget -O xt http://git.io/v3DR0 && chmod +x xt && ./xt && rm xt;;

        *) echo 'INVALID OPTION!' ;;
            esac
done