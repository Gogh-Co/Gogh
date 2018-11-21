#!/usr/bin/env bash

# |
# | Early pre-requisites check
# | ===========================================
UUIDGEN="${UUIDGEN:-$(command -v uuidgen)}"
DCONF="${DCONF:-$(command -v dconf)}"
GCONF="${GCONF:-$(command -v gconftool)}"
GS="${GS:-$(command -v gsettings)}"

case "${TERMINAL}" in
  pantheon-terminal|io.elementary.t* )
    if [[ -z "${GS}" ]]; then
      printf '\n%s\n' "Error gsettings not found"
      printf '%s\n' "sudo apt install dconf?"
      printf '%s\n\n' "or export GS=/path/to/gsettings"
      exit 1
    fi
    ;;

  mintty )
    CFGFILE="${HOME}/.minttyrc"
    if [[ ! -f "$CFGFILE" ]]; then
      printf '\n%s\n' "Warning: Couldn't find an existing configuration file, so one will be created for you."
      printf '%s\n\n' "Warning: Are you really running Cygwin's mintty?"
      touch "$CFGFILE"
    fi
    ;;
  guake|tilix|mate-terminal|gnome-terminal* )
    case "${TERMINAL}" in
      guake|gnome-terminal* )
        if [[ -z "${DCONF}" ]] && [[ -z "${GCONFTOOL}" ]]; then
          printf '\n%s\n' "Error gconftool not found!"
          printf '%s\n' "sudo apt install gconftool?"
          printf '%s\n\n' "or export GCONFTOOL=/path/to/gconftool/"
          exit 1
        fi
      ;;
    esac
    if [[ -z "${DCONF}" ]]; then
      printf '\n%s\n' "Error dconf not found"
      printf '%s\n' "sudo apt install dconf?"
      printf '%s\n\n' "or export DCONF=/path/to/dconf"
      exit 1
    fi
    ;;

  * )
    printf '%s\n' "Unsupported terminal"
    exit 1
    ;;
esac


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

    sed -i -r -e "s/^${name}=.+/$(createMinttyEntry "${name}" "${colour}")/g" "${config}"

    #echo "$(cat < "${config}" | grep -v -e "^${name}=")" > "$config"
    #echo -n "$(createMinttyEntry "${name}" "${colour}")" >> "$config"
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
    local val="$1"

    "$DCONF" write "$PROFILE_KEY/$key" "$val"
}

# Because dconf still doesn't have "append"
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

gcset() {
    local type="$1"; shift
    local key="$1"; shift
    local val="$1"

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

gset() {
  local key="$1"; shift
  local val="$1"

  gsettings set "${PROFILE_KEY}" "${key}" "${val}"
}

set_theme() {
    dset visible-name "'${PROFILE_NAME}'"
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
# | If terminal supports truecolor then we can show theme colors without applying the theme
# | ===========================================
if [[ "${COLORTERM:-}" == "truecolor" ]] || [[ "${COLORTERM:-}" == "24bit" ]]; then
    # gogh_colors have been moved here to avoid multiple definitions
    function gogh_colors () {
      # Build up the color string to avoid visual rendering
      local color_str
      # Note: {01..16} does not work on OSX
      for c in $(seq -s " " -w 16); do
        local color="COLOR_$c"
        set -- $(hexRGBtoDecRGB "${!color}")
        color_str+="\033[38;2;${1};${2};${3}m█████$(tput sgr0)"
        [[ ${GOGH_DRY_RUN:-0} -eq 1 ]] && declare DEMO_COLOR_${c}="\033[38;2;${1};${2};${3}m"
        [[ "$c" == "08" ]] && color_str+="\n" # new line
      done
      printf '\n%b\n\n\n' "${color_str}"
    }
else
    function gogh_colors () {
      # Build up the color string to avoid visual rendering
      local color_str
      for c in {0..15}; do
        color_str+="$(tput setaf $c)█████$(tput sgr0)"
        [[ $c == 7 ]] && color_str+="\n" # new line
      done
      printf '\n%b\n\n' "${color_str}"
    }
fi


# |
# | Print theme colors
# | ===========================================
gogh_colors
[[ ${GOGH_DRY_RUN:-0} -eq 1 ]] && color

# End here if dry run was initiated
[[ ${GOGH_DRY_RUN:-0} -eq 1 ]] && return 0


apply_elementary() {
    # |
    # | Applying values on elementary/pantheon terminal
    # | ===========================================
    gset background "${BACKGROUND_COLOR}"
    gset foreground "${FOREGROUND_COLOR}"
    gset cursor-color "${CURSOR_COLOR}"
    gset palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
}

apply_cygwin() {
  # |
  # | Applying values on mintty (cygwin)
  # | ===========================================

  echo "Patching mintty configuration file (${CFGFILE}) with new colours..."

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
}

apply_darwin() {
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
}

apply_gtk() {
  # |
  # | Applying values to gnome/mate/tilix
  # | ===========================================

  local legacy="$1"

  : ${PROFILE_NAME:="Default"}
  : ${PROFILE_SLUG:="Default"}

  DEFAULT_KEY="${BASE_KEY}/${DEFAULT_SLUG}"
  PROFILE_KEY="${BASE_KEY}/${PROFILE_SLUG}"

  if [[ -z "${legacy}" ]]; then
    if [[ -z "$($DCONF list ${BASE_KEY}/)" ]]; then
      # Provide a user friendly error text if no saved profile exists, otherwise it will display "Error gconftool not found!"
      # it could happen on a newly installed system. (happened on CentOS 7)
      echo "Error, no saved profiles found!"
      echo "Possible fix, new a profile (Terminal > Edit > Preferences > Profiles > New, then Close) and try again."
      echo "You can safely delete the created profile after the installation."
      exit 1
    fi

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

    # copy existing settings from default profile
    $DCONF dump "${DEFAULT_KEY}/" | $DCONF load "${PROFILE_KEY}/"
    echo $DEFAULT_KEY
    echo $PROFILE_KEY

    # add new copy to global list of profiles
    dlist_append "${PROFILE_LIST_KEY}" "${PROFILE_SLUG#:}"

    set_theme
    dset palette "${LEFT_WRAPPER:-}'${COLOR_01}${PALETTE_DELIM}${COLOR_02}${PALETTE_DELIM}${COLOR_03}${PALETTE_DELIM}${COLOR_04}${PALETTE_DELIM}${COLOR_05}${PALETTE_DELIM}${COLOR_06}${PALETTE_DELIM}${COLOR_07}${PALETTE_DELIM}${COLOR_08}${PALETTE_DELIM}${COLOR_09}${PALETTE_DELIM}${COLOR_10}${PALETTE_DELIM}${COLOR_11}${PALETTE_DELIM}${COLOR_12}${PALETTE_DELIM}${COLOR_13}${PALETTE_DELIM}${COLOR_14}${PALETTE_DELIM}${COLOR_15}${PALETTE_DELIM}${COLOR_16}'${RIGHT_WRAPPER:-}"
    
    dset allow-bold "true" #mate guake
  else
    # Append the Base16 profile to the profile list
    glist_append string "${PROFILE_LIST_KEY}" "$PROFILE_SLUG"

    gcset string visible_name "{$PROFILE_NAME}"
    gcset string palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
    gcset string background_color "${BACKGROUND_COLOR}"
    gcset string foreground_color "${FOREGROUND_COLOR}"
    gcset string bold_color "${FOREGROUND_COLOR}"
    gcset bool   bold_color_same_as_fg "true"
    gcset bool   use_theme_colors "false"
    gcset bool   use_theme_background "false"
  fi
}

apply_guake() {
  # |
  # | Applying values to guake
  # | ===========================================

  local legacy="$1"
  PROFILE_KEY="/apps/guake/style/font"

  if [[ -z "${legacy}" ]]; then
    dset palette "'${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}:${FOREGROUND_COLOR}:${BACKGROUND_COLOR}'"
    dset palette-name "'${PROFILE_NAME}'"
    dset allow-bold 'true'
  else
    gcset string color "${FOREGROUND_COLOR}"
    gcset string palette "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
    gcset string palette-name "${PROFILE_NAME}"
    PROFILE_KEY="/apps/guake/style/background"
    gcset string color "${BACKGROUND_COLOR}"

  fi
}

appy_tilixschemes() {
  if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
    [[ -d "$HOME/.config/tilix/schemes" ]] || mkdir -p "${HOME}/.config/tilix/schemes"

    TILIXCOLORS='{\n\t"name": "'${PROFILE_NAME}'",\n\t"comment": "Generated by Gogh",\n\t"foreground-color": "'${FOREGROUND_COLOR}'",\n\t"background-color":"'${BACKGROUND_COLOR}'",\n\t"cursor-background-color": "'${CURSOR_COLOR}'",\n\t"palette": [\n\t\t"'${COLOR_01}'",\n\t\t"'${COLOR_02}'",\n\t\t"'${COLOR_03}'",\n\t\t"'${COLOR_04}'",\n\t\t"'${COLOR_05}'",\n\t\t"'${COLOR_06}'",\n\t\t"'${COLOR_07}'",\n\t\t"'${COLOR_08}'",\n\t\t"'${COLOR_09}'",\n\t\t"'${COLOR_10}'",\n\t\t"'${COLOR_11}'",\n\t\t"'${COLOR_12}'",\n\t\t"'${COLOR_13}'",\n\t\t"'${COLOR_14}'",\n\t\t"'${COLOR_15}'",\n\t\t"'${COLOR_16}'"\n\t],\n\t"use-badge-color": false,\n\t"use-bold-color": false,\n\t"use-cursor-color": false,\n\t"use-highlight-color": false,\n\t"use-theme-colors": false\n}'
    echo -e "$TILIXCOLORS" > "${scratchdir}/${PROFILE_NAME}.json"

    # Note: Tilix does not store color scheme name in dconf
    # so we have to update color palette for the current profile in order to switch to the new theme
    # but only set the palette on the last loop to avoid a flashing terminal
    if ((LOOP == OPTLENGTH)); then
        cp -f "${scratchdir}"/* "$HOME/.config/tilix/schemes/"
        rm -rf "${scratchdir}"
        read -r -p "All done - apply new theme? [y/N] " -n 1 TILIX_RES
        if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
            PROFILE_KEY="${BASE_KEY}/${DEFAULT_SLUG}"
            PROFILE_NAME="$($DCONF read ${PROFILE_KEY}/visible-name | tr -d \')"
            set_theme
            dset palette "['${COLOR_01}', '${COLOR_02}', '${COLOR_03}', '${COLOR_04}', '${COLOR_05}', '${COLOR_06}', '${COLOR_07}', '${COLOR_08}', '${COLOR_09}', '${COLOR_10}', '${COLOR_11}', '${COLOR_12}', '${COLOR_13}', '${COLOR_14}', '${COLOR_15}', '${COLOR_16}']"
        fi
    fi

    unset PROFILE_NAME
    unset PROFILE_SLUG
    unset TILIXCOLORS
    exit 0
  fi
}


[[ -n "${UUIDGEN}" ]] && PROFILE_SLUG="$(uuidgen)"

case "${TERMINAL}" in
  pantheon-terminal|io.elementary.t* )
    if [[ "${TERMINAL}" == "pantheon-terminal" ]]; then
      PROFILE_KEY="org.pantheon.terminal.settings"
    else
      PROFILE_KEY="io.elementary.terminal.settings"
    fi
    apply_elementary
    ;;

  iTerm.app )
    apply_darwin
    ;;

  mintty )
    apply_cygwin
    ;;

  guake|gnome-terminal* )
    if [[ -z ${DCONF} ]]; then
      if [[ "${TERMINAL}" == "guake" ]]; then
        apply_guake legacy
      else
        BASE_KEY="/apps/gnome-terminal/profiles"
        apply_gtk legacy
      fi
    else
      if [[ "${TERMINAL}" == "guake" ]]; then
        apply_guake
      else
        BASE_KEY="/org/gnome/terminal/legacy/profiles:"
        PROFILE_LIST_KEY="${BASE_KEY}/list"
        PROFILE_SLUG=":${PROFILE_SLUG}"

        : ${DEFAULT_SLUG:=":$($DCONF read ${BASE_KEY}/default | tr -d \')"}
        : ${DEFAULT_SLUG:=":$($DCONF list ${BASE_KEY}/ | grep '/$' | head -n1 | tr -d ':/')"}

        echo $PROFILE_SLUG
        echo $DEFAULT_SLUG

        LEFT_WRAPPER="["
        RIGHT_WRAPPER=]
        PALETTE_DELIM="', '"

        apply_gtk
      fi
    fi
    ;;
  
  mate-terminal )
    BASE_KEY="/org/mate/terminal/profiles"
    PROFILE_LIST_KEY="${BASE_KEY/profiles/global}/profile-list"

    : ${DEFAULT_SLUG:="$($DCONF read ${BASE_KEY/profiles/global}/default-profile | tr -d \')"}
    : ${DEFAULT_SLUG:="$($DCONF list ${BASE_KEY}/ | grep '/$' | head -n1 | tr -d '/')"}

    PALETTE_DELIM=":"

    apply_gtk
    ;;

  tilix )
    BASE_KEY="/com/gexperts/Tilix/profiles"
    PROFILE_LIST_KEY="${BASE_KEY}/list"

    : ${DEFAULT_SLUG:="$($DCONF read ${BASE_KEY}/default | tr -d \')"}
    : ${DEFAULT_SLUG:="$($DCONF list ${BASE_KEY}/ | grep '/$' | head -n1 | tr -d '/')"}

    LEFT_WRAPPER="["
    RIGHT_WRAPPER=]
    PALETTE_DELIM="', '"

    appy_tilixschemes
    apply_gtk
    ;;

esac
    
unset PROFILE_NAME
unset PROFILE_SLUG
unset DEFAULT_SLUG