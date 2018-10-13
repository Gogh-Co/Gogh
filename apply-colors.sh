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
    R="$(hexToDec ${1:1:2})"
    G="$(hexToDec ${1:3:2})"
    B="$(hexToDec ${1:5:2})"

    echo "$R" "$G" "$B"
}

convertRGBtoMac () {
    read R G B<<<$(hexRGBtoDecRGB $1)

    R=$(echo "${R} / 255" | bc -l)
    G=$(echo "${G} / 255" | bc -l)
    B=$(echo "${B} / 255" | bc -l)

    echo "$R" "$G" "$B"
}

createMinttyEntry () {
    local name="$1"
    local colour="$2"

    read R G B<<<$(hexRGBtoDecRGB $colour)
    echo "$name=$R,$G,$B"
}

updateMinttyConfig () {
    local config="$1"
    local colour="$2"
    local name="$3"

    echo "`cat "${config}" | grep -v -e "^${name}="`" > $config
    echo -n "$(createMinttyEntry ${name} ${colour})" >> $config
}

convertNameAndRGBtoITerm() {
    local name=$1
    read R G B<<<$(convertRGBtoMac $2)
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

    local entries="$(
            {
                "$DCONF" read "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
                echo "'$val'"
            } | head -c-1 | tr "\n" ,
        )"

    "$DCONF" write "$key" "[$entries]"
}

set_theme() {
    dset visible-name "'$PROFILE_NAME'"
    dset background-color "'${BACKGROUND_COLOR}'"
    dset foreground-color "'${FOREGROUND_COLOR}'"
    if [ ! -z "${BOLD_COLOR}" ]; then
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
# | Check for the terminal name (depening on os)
# | ===========================================
if [[ -z "$TERMINAL" ]]; then
  OS=$(uname)
  if [ "$OS" = "Darwin" ]; then
      # |
      # | Check for the terminal name and decide how to apply
      # | ===========================================
      TERMINAL=$TERM_PROGRAM
  elif [ "${OS#CYGWIN}" != "${OS}" ]; then
      TERMINAL="mintty"
  else
      TERMINAL="$(ps -p $(ps -p $(ps -p $$ -o ppid=) -o ppid=) -o args=)"
  fi
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
        DEFAULT_SLUG=$($DCONF read $BASE_DIR/global/default-profile | tr -d \')
    else
        DEFAULT_SLUG=$($DCONF list $PROFILE_DIR/ | head -n1 | tr -d \/)
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
    if which "$DCONF" > /dev/null 2>&1; then
        [[ -z "$BASE_KEY_NEW" ]] && BASE_KEY_NEW=/org/gnome/terminal/legacy/profiles:

        if [[ -n "$($DCONF list $BASE_KEY_NEW/)" ]]; then
            if which "$UUIDGEN" > /dev/null 2>&1; then
                PROFILE_SLUG=$(uuidgen)
            fi

            if [[ -n "$($DCONF read $BASE_KEY_NEW/default)" ]]; then
                DEFAULT_SLUG=$($DCONF read $BASE_KEY_NEW/default | tr -d \')
            else
                DEFAULT_SLUG=$($DCONF list $BASE_KEY_NEW/ | grep '^:' | head -n1 | tr -d :/)
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
      GCONFTOOL=$(which gconftool 2>/dev/null)
      if [[ "$?" -ne 0 ]]; then
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

        local entries="$(
            {
                "$GCONFTOOL" --get "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
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
