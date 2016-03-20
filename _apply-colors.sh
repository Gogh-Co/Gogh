#!/bin/bash

# |
# | Convert RGB to gnome colors
# | ===========================================
function gnome_color () {

    AA=${1:1:2}
    BB=${1:3:2}
    CC=${1:5:2}

    echo "#${AA}${AA}${BB}${BB}${CC}${CC}"
}

# |
# | Check for OS and decide how to apply
# | ===========================================
if [ $(lsb_release -c -s) = "freya" ]; then

    # |
    # | Apply Variables
    # | ===========================================
    gsettings set org.pantheon.terminal.settings background "${BACKGROUND_COLOR}"
    gsettings set org.pantheon.terminal.settings foreground "${FOREGROUND_COLOR}"
    gsettings set org.pantheon.terminal.settings cursor-color "${CURSOR_COLOR}"
    gsettings set org.pantheon.terminal.settings palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"

else

    # |
    # | Set gnome Variables
    # | ===========================================
    BACKGROUND_COLOR=$(gnome_color $BACKGROUND_COLOR)
    FOREGROUND_COLOR=$(gnome_color $FOREGROUND_COLOR)
    COLOR_01=$(gnome_color $COLOR_01)
    COLOR_02=$(gnome_color $COLOR_02)
    COLOR_03=$(gnome_color $COLOR_03)
    COLOR_04=$(gnome_color $COLOR_04)
    COLOR_05=$(gnome_color $COLOR_05)
    COLOR_06=$(gnome_color $COLOR_06)
    COLOR_07=$(gnome_color $COLOR_07)
    COLOR_08=$(gnome_color $COLOR_08)
    COLOR_09=$(gnome_color $COLOR_09)
    COLOR_10=$(gnome_color $COLOR_10)
    COLOR_11=$(gnome_color $COLOR_11)
    COLOR_12=$(gnome_color $COLOR_12)
    COLOR_13=$(gnome_color $COLOR_13)
    COLOR_14=$(gnome_color $COLOR_14)
    COLOR_15=$(gnome_color $COLOR_15)
    COLOR_16=$(gnome_color $COLOR_16)

    # |
    # | Apply Variables
    # | ===========================================


    [[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Default"
    [[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="Default"
    [[ -z "$DCONF" ]] && DCONF=dconf
    [[ -z "$UUIDGEN" ]] && UUIDGEN=uuidgen

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

    # Newest versions of gnome-terminal use dconf
    if which "$DCONF" > /dev/null 2>&1; then
        [[ -z "$BASE_KEY_NEW" ]] && BASE_KEY_NEW=/org/gnome/terminal/legacy/profiles:

        if [[ -n "`$DCONF list $BASE_KEY_NEW/`" ]]; then
            if which "$UUIDGEN" > /dev/null 2>&1; then
                PROFILE_SLUG=`uuidgen`
            fi

            if [[ -n "`$DCONF read $BASE_KEY_NEW/default`" ]]; then
                DEFAULT_SLUG=`$DCONF read $BASE_KEY_NEW/default | tr -d \'`
            else
                DEFAULT_SLUG=`$DCONF list $BASE_KEY_NEW/ | grep '^:' | head -n1 | tr -d :/`
            fi

            DEFAULT_KEY="$BASE_KEY_NEW/:$DEFAULT_SLUG"
            PROFILE_KEY="$BASE_KEY_NEW/:$PROFILE_SLUG"

            # copy existing settings from default profile
            $DCONF dump "$DEFAULT_KEY/" | $DCONF load "$PROFILE_KEY/"

            # add new copy to list of profiles
            dlist_append $BASE_KEY_NEW/list "$PROFILE_SLUG"

            # update profile values with theme options
            dset visible-name "'$PROFILE_NAME'"
            dset palette "['${COLOR_01}', '${COLOR_02}', '${COLOR_03}', '${COLOR_04}', '${COLOR_05}', '${COLOR_06}', '${COLOR_07}', '${COLOR_08}', '${COLOR_09}', '${COLOR_10}', '${COLOR_11}', '${COLOR_12}', '${COLOR_13}', '${COLOR_14}', '${COLOR_15}', '${COLOR_16}']"
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

            unset PROFILE_NAME
            unset PROFILE_SLUG
            unset DCONF
            unset UUIDGEN
            exit 0
        fi
    fi

    # Fallback for Gnome 2 and early Gnome 3
    [[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
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

        "$GCONFTOOL" --set --type list --list-type $type "$key" "[$entries]"
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

# |
# | View color scheme in terminal
# | ===========================================
function gogh_colors () {
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
    echo ""
}

if [[ "$(dirname $(readlink -f "${*:-/dev/null}"))" == "$(dirname $(readlink -f "$0"))*" ]]; then
  gogh_colors
fi
