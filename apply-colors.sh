#!/usr/bin/env bash

# |
# | Convert RGB to gnome colors
# | ===========================================
gnome_color () {

    AA=${1:1:2}
    BB=${1:3:2}
    CC=${1:5:2}

    echo "#${AA}${AA}${BB}${BB}${CC}${CC}"
}

hexToDec () {
    echo "$((16#${1}))"
}

hexRGBtoDecRGB () {
    R="$(hexToDec "${1:1:2}")"
    G="$(hexToDec "${1:3:2}")"
    B="$(hexToDec "${1:5:2}")"

    echo "$R" "$G" "$B"
}

convertRGBtoMac () {
    set -- $(hexRGBtoDecRGB "$1")
    R=$1; shift; G=$1; shift; B=$1; shift

    R=$(echo "${R} / 255" | bc -l)
    G=$(echo "${G} / 255" | bc -l)
    B=$(echo "${B} / 255" | bc -l)

    echo "$R" "$G" "$B"
}

createMinttyEntry () {
    local name="$1"
    local colour="$2"
    set --
    set -- $(hexRGBtoDecRGB "$colour")
    R=$1; shift; G=$1; shift; B=$1; shift

    echo "$name=$R,$G,$B"
}

updateMinttyConfig () {
    local config="$1"
    local colour="$2"
    local name="$3"

    echo "${config}" | grep -v -e "^${name}=" > "$config"
    echo -n "$(createMinttyEntry "${name}" "${colour}")" >> "$config"
}

convertNameAndRGBtoITerm() {
    local name="$1"
    local colour="$2"
    set --
    set -- $(convertRGBtoMac "$colour")
    R=$1; shift; G=$1; shift; B=$1; shift

    echo "<key>$1</key><dict><key>Blue Component</key><real>${B}</real><key>Green Component</key><real>${G}</real><key>Red Component</key><real>${R}</real></dict>"
}

dset() {
    local key="$1"; shift
    local val="$1"; shift

    if [[ "$type" == "string" ]]; then
        val="'$val'"
    fi

    "$DCONF" write "$PROFILE_KEY/$key" "$val"
}

# because dconf still doesn't have "append"
dlist_append() {
    local key="$1"; shift
    local val="$1"; shift
    local entries
    
    entries="$(
            {
                "$DCONF" read "$key" | tr -d "[]" | tr , "\n" | grep -F -v "$val"
                echo "'$val'"
            } | head -c-1 | tr "\n" ,
        )"

    "$DCONF" write "$key" "[$entries]"
}

set_theme() {
    dset visible-name "'$PROFILE_NAME'"
    dset background-color "'${BACKGROUND_COLOR}'"
    dset foreground-color "'${FOREGROUND_COLOR}'"
    if [ -n "${BOLD_COLOR}" ]; then
        dset bold-color "'${BOLD_COLOR}'"
        dset bold-color-same-as-fg "false"
    else
        dset bold-color "'${COLOR_08}'"
        dset bold-color-same-as-fg "true"
    fi
    dset use-theme-colors "false"
    dset use-theme-background "false"
}

# |
# | Print theme colors
# | ===========================================
if command -v gogh_truecolor > /dev/null; then
  gogh_truecolor
else
  gogh_colors
fi

# |
# | Apply color scheme to terminal
# | ===========================================
if [[ "$TERMINAL" =~ "guake" ]]; then
    # |
    # | Applying values if string contains guake
    # | =============================================
    # Note: Guake still uses gconf but plans to support dconf/gsettings when reaching 1.0.0.
    #       See notes for 0.8.1 in https://github.com/Guake/guake/blob/master/NEWS.
    gconftool-2 -s -t string /apps/guake/style/background/color "${BACKGROUND_COLOR}"
    gconftool-2 -s -t string /apps/guake/style/font/color "${FOREGROUND_COLOR}"
    gconftool-2 -s -t string /apps/guake/style/font/palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
    gconftool-2 -s -t string /apps/guake/style/font/palette_name "${PROFILE_NAME}"

elif [ "$TERMINAL" = "iTerm.app" ]; then
    # |
    # | Applying values on iTerm2
    # | ===========================================
    BACKGROUND_COLOR=$(convertNameAndRGBtoITerm "Background Color" "$BACKGROUND_COLOR")
    FOREGROUND_COLOR=$(convertNameAndRGBtoITerm "Foreground Color" "$FOREGROUND_COLOR")
    COLOR_01=$(convertNameAndRGBtoITerm "Ansi 0 Color" "$COLOR_01")
    COLOR_02=$(convertNameAndRGBtoITerm "Ansi 1 Color" "$COLOR_02")
    COLOR_03=$(convertNameAndRGBtoITerm "Ansi 2 Color" "$COLOR_03")
    COLOR_04=$(convertNameAndRGBtoITerm "Ansi 3 Color" "$COLOR_04")
    COLOR_05=$(convertNameAndRGBtoITerm "Ansi 4 Color" "$COLOR_05")
    COLOR_06=$(convertNameAndRGBtoITerm "Ansi 5 Color" "$COLOR_06")
    COLOR_07=$(convertNameAndRGBtoITerm "Ansi 6 Color" "$COLOR_07")
    COLOR_08=$(convertNameAndRGBtoITerm "Ansi 7 Color" "$COLOR_08")
    COLOR_09=$(convertNameAndRGBtoITerm "Ansi 8 Color" "$COLOR_09")
    COLOR_10=$(convertNameAndRGBtoITerm "Ansi 9 Color" "$COLOR_10")
    COLOR_11=$(convertNameAndRGBtoITerm "Ansi 10 Color" "$COLOR_11")
    COLOR_12=$(convertNameAndRGBtoITerm "Ansi 11 Color" "$COLOR_12")
    COLOR_13=$(convertNameAndRGBtoITerm "Ansi 12 Color" "$COLOR_13")
    COLOR_14=$(convertNameAndRGBtoITerm "Ansi 13 Color" "$COLOR_14")
    COLOR_15=$(convertNameAndRGBtoITerm "Ansi 14 Color" "$COLOR_15")
    COLOR_16=$(convertNameAndRGBtoITerm "Ansi 15 Color" "$COLOR_16")

    # Assemble color scheme file contents
    ITERMCOLORS='<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><dict>'${BACKGROUND_COLOR}${FOREGROUND_COLOR}${COLOR_01}${COLOR_02}${COLOR_03}${COLOR_04}${COLOR_05}${COLOR_06}${COLOR_07}${COLOR_08}${COLOR_09}${COLOR_10}${COLOR_11}${COLOR_12}${COLOR_13}${COLOR_14}${COLOR_15}'</dict></plist>'

    # Dump iTerm color scheme to file and import it by opening it
    echo "$ITERMCOLORS" > "${PROFILE_NAME}.itermcolors"
    open "${PROFILE_NAME}.itermcolors"
    rm "${PROFILE_NAME}.itermcolors"

elif [ "$TERMINAL" = "pantheon-terminal" ]; then
    # |
    # | Applying values on pantheon-terminal
    # | ===========================================
    gsettings set org.pantheon.terminal.settings background "${BACKGROUND_COLOR}"
    gsettings set org.pantheon.terminal.settings foreground "${FOREGROUND_COLOR}"
    gsettings set org.pantheon.terminal.settings cursor-color "${CURSOR_COLOR}"
    gsettings set org.pantheon.terminal.settings palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"

elif [ "$TERMINAL" = "mate-terminal" ]; then
    # |
    # | Applying values on pantheon-terminal
    # | ===========================================

    [[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Default"
    [[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG=$(uuidgen)
    [[ -z "$DCONF" ]] && DCONF=dconf

    BASE_DIR=/org/mate/terminal
    PROFILE_DIR="$BASE_DIR/profiles"

    if [[ -n "$($DCONF read $BASE_DIR/global/default-profile)" ]]; then
        DEFAULT_SLUG=$($DCONF read $BASE_DIR/global/default-profile | tr -d "'")
    else
        DEFAULT_SLUG=$($DCONF list $PROFILE_DIR/ | head -n1 | tr -d "/")
    fi

    DEFAULT_KEY="$PROFILE_DIR/$DEFAULT_SLUG"
    PROFILE_KEY="$PROFILE_DIR/$PROFILE_SLUG"

    # copy existing settings from default profile
    dconf dump "$DEFAULT_KEY/" | dconf load "$PROFILE_KEY/"

    # add new copy to list of profiles
    dlist_append "$PROFILE_DIR/list" "$PROFILE_SLUG"

    # add new copy to global list of profiles
    dlist_append "$BASE_DIR/global/profile-list" "$PROFILE_SLUG"

    set_theme
    dset palette "'${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}'"
    dset allow-bold "true"

    exit 0

elif [ "$TERMINAL" = "mintty" ]; then
    # |
    # | Applying values on mintty (cygwin)
    # | ===========================================

    CFGFILE="${HOME}/.minttyrc"
    echo "Patching mintty configuration file (${CFGFILE}) with new colours..."

    if [[ ! -f "$CFGFILE" ]]; then
        echo ""
        echo "Warning: Couldn't find an existing configuration file, so one will be created for you."
        echo "Warning: Are you really running Cygwin's mintty?"
        echo ""
        touch "$CFGFILE"
    fi

    updateMinttyConfig "$CFGFILE" "$COLOR_01" "Black"
    updateMinttyConfig "$CFGFILE" "$COLOR_02" "Red"
    updateMinttyConfig "$CFGFILE" "$COLOR_03" "Green"
    updateMinttyConfig "$CFGFILE" "$COLOR_04" "Yellow"
    updateMinttyConfig "$CFGFILE" "$COLOR_05" "Blue"
    updateMinttyConfig "$CFGFILE" "$COLOR_06" "Magenta"
    updateMinttyConfig "$CFGFILE" "$COLOR_07" "Cyan"
    updateMinttyConfig "$CFGFILE" "$COLOR_08" "White"

    updateMinttyConfig "$CFGFILE" "$COLOR_09" "BoldBlack"
    updateMinttyConfig "$CFGFILE" "$COLOR_10" "BoldRed"
    updateMinttyConfig "$CFGFILE" "$COLOR_11" "BoldGreen"
    updateMinttyConfig "$CFGFILE" "$COLOR_12" "BoldYellow"
    updateMinttyConfig "$CFGFILE" "$COLOR_13" "BoldBlue"
    updateMinttyConfig "$CFGFILE" "$COLOR_14" "BoldMagenta"
    updateMinttyConfig "$CFGFILE" "$COLOR_15" "BoldCyan"
    updateMinttyConfig "$CFGFILE" "$COLOR_16" "BoldWhite"

    updateMinttyConfig "$CFGFILE" "$BACKGROUND_COLOR" "BackgroundColour"
    updateMinttyConfig "$CFGFILE" "$FOREGROUND_COLOR" "ForegroundColour"
    updateMinttyConfig "$CFGFILE" "$CURSOR_COLOR" "CursorColour"

    echo "Done - please reopen your Cygwin terminal to see the changes"
    exit 0

elif [ "$TERMINAL" = "io.elementary.terminal" ]; then
    # |
    # | Applying values io.elementary.terminal
    # | ===========================================
    gsettings set io.elementary.terminal.settings background "${BACKGROUND_COLOR}"
    gsettings set io.elementary.terminal.settings foreground "${FOREGROUND_COLOR}"
    gsettings set io.elementary.terminal.settings cursor-color "${CURSOR_COLOR}"
    gsettings set io.elementary.terminal.settings palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"

elif [ "$TERMINAL" = "tilix" ]; then
    # |
    # | Applying values to tilix
    # | ===========================================
    BACKGROUND_COLOR=$(gnome_color "$BACKGROUND_COLOR")
    FOREGROUND_COLOR=$(gnome_color "$FOREGROUND_COLOR")
    COLOR_01=$(gnome_color "$COLOR_01")
    COLOR_02=$(gnome_color "$COLOR_02")
    COLOR_03=$(gnome_color "$COLOR_03")
    COLOR_04=$(gnome_color "$COLOR_04")
    COLOR_05=$(gnome_color "$COLOR_05")
    COLOR_06=$(gnome_color "$COLOR_06")
    COLOR_07=$(gnome_color "$COLOR_07")
    COLOR_08=$(gnome_color "$COLOR_08")
    COLOR_09=$(gnome_color "$COLOR_09")
    COLOR_10=$(gnome_color "$COLOR_10")
    COLOR_11=$(gnome_color "$COLOR_11")
    COLOR_12=$(gnome_color "$COLOR_12")
    COLOR_13=$(gnome_color "$COLOR_13")
    COLOR_14=$(gnome_color "$COLOR_14")
    COLOR_15=$(gnome_color "$COLOR_15")
    COLOR_16=$(gnome_color "$COLOR_16")

    # |
    # | Apply Variables
    # | ===========================================


    [[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Default"
    [[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="Default"
    [[ -z "$DCONF" ]] && DCONF=dconf
    [[ -z "$UUIDGEN" ]] && UUIDGEN=uuidgen

    [[ -z "$BASE_KEY_NEW" ]] && BASE_KEY_NEW=/com/gexperts/Tilix/profiles

    if [[ -n "$($DCONF list $BASE_KEY_NEW/)" ]]; then
        if command -v "$UUIDGEN" > /dev/null 2>&1; then
            PROFILE_SLUG=$(uuidgen)
        fi

        if [[ -n "$($DCONF read $BASE_KEY_NEW/default)" ]]; then
            DEFAULT_SLUG=$($DCONF read $BASE_KEY_NEW/default | tr -d "'")
        else
            DEFAULT_SLUG=$($DCONF list $BASE_KEY_NEW/ | grep '\/$' | head -n1 | tr -d "/")
        fi

        if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
          [[ -d "$HOME/.config/tilix/schemes" ]] || mkdir -p "${HOME}/.config/tilix/schemes"

          TILIXCOLORS='{\n\t"background-color":"'${BACKGROUND_COLOR}'",\n\t"badge-color": "#FFFFFF",\n\t"bold-color": "#FFFFFF",\n\t"comment": "Generated by Gogh",\n\t"cursor-background-color": "#000000",\n\t"cursor-foreground-color": "'${CURSOR_COLOR}'",\n\t"foreground-color": "#FFFFFF",\n\t"highlight-background-color": "#000000",\n\t"highlight-foreground-color": "#FFFFFF",\n\t"name": "'${PROFILE_NAME}'",\n\t"palette": [\n\t\t"'${COLOR_01}'",\n\t\t"'${COLOR_02}'",\n\t\t"'${COLOR_03}'",\n\t\t"'${COLOR_04}'",\n\t\t"'${COLOR_05}'",\n\t\t"'${COLOR_06}'",\n\t\t"'${COLOR_07}'",\n\t\t"'${COLOR_08}'",\n\t\t"'${COLOR_09}'",\n\t\t"'${COLOR_10}'",\n\t\t"'${COLOR_11}'",\n\t\t"'${COLOR_12}'",\n\t\t"'${COLOR_13}'",\n\t\t"'${COLOR_14}'",\n\t\t"'${COLOR_15}'",\n\t\t"'${COLOR_16}'"\n\t],\n\t"use-badge-color": false,\n\t"use-bold-color": false,\n\t"use-cursor-color": true,\n\t"use-highlight-color": false,\n\t"use-theme-colors": false\n}'
          echo -e "$TILIXCOLORS" > "${scratchdir}/${PROFILE_NAME}.json"

          # Note: Tilix does not store color scheme name in dconf
          # so we have to update color palette for the current profile in order to switch to the new theme
          # but only set the palette on the last loop to avoid a flashing terminal
          if ((LOOP == OPTLENGTH)); then
              cp -f "$scratchdir"/* "$HOME/.config/tilix/schemes/"
              rm -rf "${scratchdir}"
              read -r -p "All done - apply new theme? [y/N] " -n 1 TILIX_RES
              if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
                  PROFILE_KEY="$BASE_KEY_NEW/$DEFAULT_SLUG"
                  PROFILE_NAME=$($DCONF read $PROFILE_KEY/visible-name | tr -d "'")
                  set_theme
                  dset palette "['${COLOR_01}', '${COLOR_02}', '${COLOR_03}', '${COLOR_04}', '${COLOR_05}', '${COLOR_06}', '${COLOR_07}', '${COLOR_08}', '${COLOR_09}', '${COLOR_10}', '${COLOR_11}', '${COLOR_12}', '${COLOR_13}', '${COLOR_14}', '${COLOR_15}', '${COLOR_16}']"
              fi
          fi

          unset PROFILE_NAME
          unset PROFILE_SLUG
          unset DCONF
          unset UUIDGEN
          unset TILIXCOLORS
          exit 0
        fi

        DEFAULT_KEY="$BASE_KEY_NEW/$DEFAULT_SLUG"
        PROFILE_KEY="$BASE_KEY_NEW/$PROFILE_SLUG"

        # copy existing settings from default profile
        $DCONF dump "$DEFAULT_KEY/" | $DCONF load "$PROFILE_KEY/"

        # add new copy to list of profiles
        dlist_append "$BASE_KEY_NEW/list" "$PROFILE_SLUG"

        # update profile values with theme options
        set_theme
        dset palette "['${COLOR_01}', '${COLOR_02}', '${COLOR_03}', '${COLOR_04}', '${COLOR_05}', '${COLOR_06}', '${COLOR_07}', '${COLOR_08}', '${COLOR_09}', '${COLOR_10}', '${COLOR_11}', '${COLOR_12}', '${COLOR_13}', '${COLOR_14}', '${COLOR_15}', '${COLOR_16}']"

        unset PROFILE_NAME
        unset PROFILE_SLUG
        unset DCONF
        unset UUIDGEN
        exit 0
    else
        # provide a user friendly error text if no saved profile exists, otherwise it will display "Error gconftool not found!"
        # it could happen on a newly installed system. (happened on CentOS 7)
        echo "Error, no saved profiles found!"
        echo "Possible fix, new a profile (Terminal > Settings > New profile, then Close) and try again."
        echo "You can safely delete the created profile after the installation."
        exit 1
    fi
else
    # |
    # | Applying values on gnome-terminal
    # | ===========================================
    BACKGROUND_COLOR=$(gnome_color "$BACKGROUND_COLOR")
    FOREGROUND_COLOR=$(gnome_color "$FOREGROUND_COLOR")
    COLOR_01=$(gnome_color "$COLOR_01")
    COLOR_02=$(gnome_color "$COLOR_02")
    COLOR_03=$(gnome_color "$COLOR_03")
    COLOR_04=$(gnome_color "$COLOR_04")
    COLOR_05=$(gnome_color "$COLOR_05")
    COLOR_06=$(gnome_color "$COLOR_06")
    COLOR_07=$(gnome_color "$COLOR_07")
    COLOR_08=$(gnome_color "$COLOR_08")
    COLOR_09=$(gnome_color "$COLOR_09")
    COLOR_10=$(gnome_color "$COLOR_10")
    COLOR_11=$(gnome_color "$COLOR_11")
    COLOR_12=$(gnome_color "$COLOR_12")
    COLOR_13=$(gnome_color "$COLOR_13")
    COLOR_14=$(gnome_color "$COLOR_14")
    COLOR_15=$(gnome_color "$COLOR_15")
    COLOR_16=$(gnome_color "$COLOR_16")

    # |
    # | Apply Variables
    # | ===========================================


    [[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Default"
    [[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="Default"
    [[ -z "$DCONF" ]] && DCONF=dconf
    [[ -z "$UUIDGEN" ]] && UUIDGEN=uuidgen

    # Newest versions of gnome-terminal use dconf
    if command -v "$DCONF" > /dev/null 2>&1; then
        [[ -z "$BASE_KEY_NEW" ]] && BASE_KEY_NEW=/org/gnome/terminal/legacy/profiles:

        if [[ -n "$($DCONF list $BASE_KEY_NEW/)" ]]; then
            if command -v "$UUIDGEN" > /dev/null 2>&1; then
                PROFILE_SLUG=$(uuidgen)
            fi

            if [[ -n "$($DCONF read $BASE_KEY_NEW/default)" ]]; then
                DEFAULT_SLUG=$($DCONF read $BASE_KEY_NEW/default | tr -d "'")
            else
                DEFAULT_SLUG=$($DCONF list $BASE_KEY_NEW/ | grep '^:' | head -n1 | tr -d ":/")
            fi

            DEFAULT_KEY="$BASE_KEY_NEW/:$DEFAULT_SLUG"
            PROFILE_KEY="$BASE_KEY_NEW/:$PROFILE_SLUG"

            # copy existing settings from default profile
            $DCONF dump "$DEFAULT_KEY/" | $DCONF load "$PROFILE_KEY/"

            # add new copy to list of profiles
            dlist_append "$BASE_KEY_NEW/list" "$PROFILE_SLUG"

            # update profile values with theme options
	    set_theme
	    dset palette "['${COLOR_01}', '${COLOR_02}', '${COLOR_03}', '${COLOR_04}', '${COLOR_05}', '${COLOR_06}', '${COLOR_07}', '${COLOR_08}', '${COLOR_09}', '${COLOR_10}', '${COLOR_11}', '${COLOR_12}', '${COLOR_13}', '${COLOR_14}', '${COLOR_15}', '${COLOR_16}']"

            unset PROFILE_NAME
            unset PROFILE_SLUG
            unset DCONF
            unset UUIDGEN
            exit 0
        else
            # provide a user friendly error text if no saved profile exists, otherwise it will display "Error gconftool not found!"
            # it could happen on a newly installed system. (happened on CentOS 7)
            echo "Error, no saved profiles found!"
            echo "Possible fix, new a profile (Terminal > Edit > Preferences > Profiles > New, then Close) and try again."
            echo "You can safely delete the created profile after the installation."
            exit 1
        fi
    fi

    # Fallback for Gnome 2 and early Gnome 3

    # error handling on gconftool
    if [[ -z "$GCONFTOOL" ]]; then
      GCONFTOOL=$(command -v gconftool 2>/dev/null)
      if [[ GCONFTOOL -ne 0 ]]; then
        echo "Error gconftool not found!"
        echo "Possible fix, enter the following and run again:"
        echo "export GCONFTOOL=/path/to/gconftool/"
        exit 1
      fi
    fi

    [[ -z "$BASE_KEY" ]] && BASE_KEY=/apps/gnome-terminal/profiles

    PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

    gset() {
        local type="$1"; shift
        local key="$1"; shift
        local val="$1"; shift

        "$GCONFTOOL" --set --type "$type" "$PROFILE_KEY/$key" -- "$val"
    }

    # Because gconftool doesn't have "append"
    glist_append() {
        local type="$1"; shift
        local key="$1"; shift
        local val="$1"; shift
        local entries

        entries="$(
            {
                "$GCONFTOOL" --get "$key" | tr -d "[]" | tr , "\n" | grep -F -v "$val"
                echo "$val"
            } | head -c-1 | tr "\n" ,
        )"

        "$GCONFTOOL" --set --type list --list-type "$type" "$key" "[$entries]"
    }

    # Append the Base16 profile to the profile list
    glist_append string /apps/gnome-terminal/global/profile_list "$PROFILE_SLUG"

    gset string visible_name "$PROFILE_NAME"
    gset string palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
    gset string background_color "${BACKGROUND_COLOR}"
    gset string foreground_color "${FOREGROUND_COLOR}"
    gset string bold_color "${FOREGROUND_COLOR}"
    gset bool   bold_color_same_as_fg "true"
    gset bool   use_theme_colors "false"
    gset bool   use_theme_background "false"

    unset PROFILE_NAME
    unset PROFILE_SLUG
    unset DCONF
    unset UUIDGEN
fi
