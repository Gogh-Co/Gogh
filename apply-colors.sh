#!/usr/bin/env bash

# |
# | Early pre-requisites check
# | ===========================================
UUIDGEN="${UUIDGEN:-$(command -v uuidgen | xargs echo)}"
DCONF="${DCONF:-$(command -v dconf | xargs echo)}"
GCONF="${GCONF:-$(command -v gconftool-2 | xargs echo)}"
GS="${GS:-$(command -v gsettings | xargs echo)}"
# Note: xargs echo is to make the command sucessful even if it was not
# otherwise the script will exit if the command does not exist (elementary os)

# |
# | Make sure all exported variables get unset no matter what
# | Defining this in this script because it gets called even if
# | gogh.sh was not called. Exported variables in gogh.sh gets
# | handled there in case there was en error before this script was called
# | ============================================
GLOBAL_VAR_CLEANUP() {
  unset PROFILE_NAME
  unset PROFILE_SLUG
  unset scratchdir
  unset TILIX_RES
  unset TERMINAL
  unset LOOP
  unset OPTLENGTH

  for c in $(seq -s " " -w 16); do
    unset DEMO_COLOR_${c}
    unset COLOR_${c}
  done

  unset BACKGROUND_COLOR
  unset FOREGROUND_COLOR
  unset CURSOR_COLOR
  unset HIGHLIGHT_FG_COLOR
  unset HIGHLIGHT_BG_COLOR
  unset USE_SYS_TRANSPARENCY
  unset PROFILE_NAME
}

# Note: Since all scripts gets invoked in a subshell the traps from the parent shell
# will not get inherited. Hence traps defined in gogh.sh and print-themes.sh will still trigger
trap 'GLOBAL_VAR_CLEANUP; trap - EXIT' EXIT HUP INT QUIT PIPE TERM

# |
# | Second test for TERMINAL in case user ran
# | theme script directly instead of gogh.sh
# | ============================================
if [[ -z "${TERMINAL:-}" ]]; then

  # |
  # | Check for the terminal name (depening on os)
  # | ===========================================
  OS="$(uname)"
  if [[ "$OS" = "Darwin" ]]; then
    TERMINAL=$TERM_PROGRAM
  elif [[ "${OS#CYGWIN}" != "${OS}" ]]; then
    TERMINAL="mintty"
  elif [[ "$TERM" = "xterm-kitty" ]]; then
    TERMINAL="kitty"
  else
    # |
    # | Depending on how the script was invoked, we need
    # | to loop until pid is no longer a subshell
    # | ===========================================
    pid="$$"
    TERMINAL="$(ps -h -o comm -p $pid)"
    while [[ "${TERMINAL:(-2)}" == "sh" ]]; do
      pid="$(ps -h -o ppid -p $pid)"
      TERMINAL="$(ps -h -o comm -p $pid)"
    done
  fi
fi


case "${TERMINAL}" in
  pantheon-terminal|io.elementary.t* )
    if [[ -z "${GS}" ]]; then
      printf '\n%s\n' "Error gsettings not found"
      printf '%s\n'   "sudo apt install dconf?"
      printf '%s\n\n' "or export GS=/path/to/gsettings"
      exit 1
    fi
    ;;

  mintty )
    CFGFILE="${HOME}/.minttyrc"
    if [[ ! -f "${CFGFILE}" ]]; then
      printf '\n%s\n' "Warning: Couldn't find an existing configuration file, so one will be created for you."
      printf '%s\n\n' "Warning: Are you really running Cygwin's mintty?"
      touch "${CFGFILE}"
    fi
    ;;

  guake|tilix|mate-terminal|gnome-terminal* )
    case "${TERMINAL}" in
      guake|gnome-terminal* )
        if [[ -z "${DCONF}" ]] && [[ -z "${GCONF}" ]]; then
          printf '\n%s\n' "Error gconftool not found!"
          printf '%s\n'   "sudo apt install gconftool?"
          printf '%s\n\n' "or export GCONF=/path/to/gconftool-2/"
          exit 1
        fi
        ;;
    esac
    if [[ -z "${DCONF}" ]]; then
      printf '\n%s\n' "Error dconf not found"
      printf '%s\n'   "sudo apt install dconf?"
      printf '%s\n\n' "or export DCONF=/path/to/dconf"
      exit 1
    fi
    ;;

  foot )
    CFGFILE="${HOME}/.config/foot/foot.ini"
    if [[ ! -f "${CFGFILE}" ]]; then
      printf '\n%s\n' "Error: Couldn't find an existing configuration file."
      exit 1
    fi
    ;;

  kitty )
    if [[ -z "${KITTY_CONFIG_DIRECTORY:-}" ]]; then
      KITTY_CONFIG_DIRECTORY="${HOME}/.config/kitty"
    fi
    CFGFILE="${KITTY_CONFIG_DIRECTORY}/kitty.conf"
    if [[ ! -f "${CFGFILE}" ]]; then
      printf '\n%s\n' "Error: Couldn't find an existing configuration file for Kitty."
      exit 1
    fi
    ;;

  konsole )
    CFGFILE="${HOME}/.config/konsolerc"
    if [[ ! -f "${CFGFILE}" ]]; then
      printf '\n%s\n' "Error: Couldn't find an existing configuration file for Konsole."
      exit 1
    fi
    ;;
esac


# |
# | Convert RGB to gnome colors
# | ===========================================
gnome_color () {

  AA=${1:1:2}
  BB=${1:3:2}
  CC=${1:5:2}

  if [[ -n "${AA:-}" ]]; then
    echo "#${AA}${AA}${BB}${BB}${CC}${CC}"
  fi
}

hexToDec () {
  echo "$((16#${1}))"
}

hexRGBtoDecRGB () {
  R="$(hexToDec "${1:1:2}")"
  G="$(hexToDec "${1:3:2}")"
  B="$(hexToDec "${1:5:2}")"

  echo "${R}" "${G}" "${B}"
}

convertRGBtoMac () {
  local color="${1}"
  set --
  set -- $(hexRGBtoDecRGB "${color}")
  R=${1}; shift; G=${1}; shift; B=${1}; shift

  R=$(echo "${R} / 255" | bc -l)
  G=$(echo "${G} / 255" | bc -l)
  B=$(echo "${B} / 255" | bc -l)

  echo "${R}" "${G}" "${B}"
}

createMinttyEntry () {
  local  name="${1}"
  local color="${2}"
  set --
  set -- $(hexRGBtoDecRGB "${color}")
  R=${1}; shift; G=${1}; shift; B=${1}; shift

  echo "${name}=${R},${G},${B}"
}

updateMinttyConfig () {
  local config="${1}"
  local  color="${2}"
  local   name="${3}"

  sed -i -r -e "s/^${name}=.+/$(createMinttyEntry "${name}" "${color}")/g" "${config}"
}

updateFootConfig () {
  local config="${1}"
  local  color="${2}"
  local   name="${3}"

  sed -i -r -e "s/^${name}=.+/${name}=${color/\#/}/g" "${config}"
}

createKonsoleEntry () {
  local   name="${1}"
  local  color="${2}"
  set --
  set -- $(hexRGBtoDecRGB "${color}")
  R=${1}; shift; G=${1}; shift; B=${1}; shift

  echo -e "[$name]\nColor=${R},${G},${B}\n"
}

createKonsoleTriple () {
  local   name="${1}"
  local colorn="${2}"  # normal and faint
  local colori="${3}"  # intense

  createKonsoleEntry "${name}" "${colorn}"
  createKonsoleEntry "${name}Faint" "${colorn}"
  createKonsoleEntry "${name}Intense" "${colori}"
}

convertNameAndRGBtoITerm() {
  local  name="${1}"
  local color="${2}"
  set --
  set -- $(convertRGBtoMac "${color}")
  R=${1}; shift; G=${1}; shift; B=${1}; shift

  echo "<key>${name}</key><dict><key>Blue Component</key><real>${B}</real><key>Green Component</key><real>${G}</real><key>Red Component</key><real>${R}</real></dict>"
}

dset() {
  local key="${1}"; shift
  local val="${1}"

  "${DCONF}" write "${PROFILE_KEY}/${key}" "${val}"
}

# Because dconf still doesn't have "append"
dlist_append() {
  local key="${1}"; shift
  local val="${1}"; shift
  local entries

  entries="$(
  {
    "${DCONF}" read "${key}" | tr -d "[]" | tr , "\n" | grep -F -v "${val}"
    echo "'${val}'"
  } | head -c-1 | tr "\n" ,
  )"

  "${DCONF}" write "${key}" "[${entries}]"
}

gcset() {
  local type="${1}"; shift
  local  key="${1}";  shift
  local  val="${1}"

  "${GCONF}" --set --type "${type}" "${PROFILE_KEY}/${key}" -- "${val}"
}

# Because gconftool doesn't have "append"
glist_append() {
  local type="${1}"; shift
  local key="${1}";  shift
  local val="${1}";  shift
  local entries

  entries="$(
  {
    "${GCONF}" --get "${key}" | tr -d "[]" | tr , "\n" | grep -F -v "${val}"
    echo "${val}"
  } | head -c-1 | tr "\n" ,
  )"

  "${GCONF}" --set --type list --list-type "${type}" "${key}" "[${entries}]"
}

gset() {
  local key="${1}"; shift
  local val="${1}"

  "${GS}" set "${PROFILE_KEY}" "${key}" "${val}"
}

set_theme() {
  dset visible-name                    "'${PROFILE_NAME}'"
  dset background-color                "'${BACKGROUND_COLOR}'"
  dset foreground-color                "'${FOREGROUND_COLOR}'"
  dset cursor-colors-set               "true"
  dset cursor-background-color         "'${CURSOR_COLOR}'"
  dset cursor-foreground-color         "'${BACKGROUND_COLOR}'"

  if [[ -n "${HIGHLIGHT_BG_COLOR:-}" ]]; then
    dset   highlight-colors-set        "true"
    dset   highlight-background-color  "'${HIGHLIGHT_BG_COLOR}'"
    if [[ -n "${HIGHLIGHT_FG_COLOR:-}" ]]; then
      dset   highlight-foreground-color  "'${HIGHLIGHT_FG_COLOR}'"
    fi
  fi

  if [[ -n "${BOLD_COLOR:-}" ]]; then
    dset   bold-color                  "'${BOLD_COLOR}'"
    dset   bold-color-same-as-fg       "false"
  else
    dset   bold-color                  "'${FOREGROUND_COLOR}'"
    dset   bold-color-same-as-fg       "true"
  fi
  dset     use-theme-colors            "false"
  dset     use-theme-background        "false"
  dset     use-theme-transparency      "${USE_SYS_TRANSPARENCY:-false}"
}

legacy_set_theme() {
  gcset string visible_name            "${PROFILE_NAME}"
  gcset string background_color        "${BACKGROUND_COLOR}"
  gcset string foreground_color        "${FOREGROUND_COLOR}"

  if [[ -n "${BOLD_COLOR:-}" ]]; then
    gcset string bold_color            "${BOLD_COLOR}"
    gcset bool   bold_color_same_as_fg "false"
  else
    gcset string bold_color            "${FOREGROUND_COLOR}"
    gcset bool   bold_color_same_as_fg "true"
  fi
  gcset bool     use_theme_colors      "false"
  gcset bool     use_theme_background  "false"
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
      [[ ${GOGH_DRY_RUN:-0} -eq 1 ]] && export "DEMO_COLOR_$c=\033[38;2;${1};${2};${3}m"
      [[ "$c" == "08" ]] && color_str+="\n" # new line
    done
    printf '\n%b\n\n\n' "${color_str}"
    unset color_str
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
    unset color_str
  }
fi


# |
# | Print theme colors
# | ===========================================
gogh_colors
if [[ ${GOGH_DRY_RUN:-0} -eq 1 ]]; then
  color
  # End here if dry run was initiated
  exit 0
fi


apply_elementary() {
  # |
  # | Applying values on elementary/pantheon terminal
  # | ===========================================
  gset background   "${BACKGROUND_COLOR}"
  gset foreground   "${FOREGROUND_COLOR}"
  gset cursor-color "${CURSOR_COLOR}"
  gset palette      "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
}

apply_cygwin() {
  # |
  # | Applying values on mintty (cygwin)
  # | ===========================================

  echo "Patching mintty configuration file (${CFGFILE}) with new colors..."

  updateMinttyConfig "$CFGFILE" "$COLOR_01"         "Black"
  updateMinttyConfig "$CFGFILE" "$COLOR_02"         "Red"
  updateMinttyConfig "$CFGFILE" "$COLOR_03"         "Green"
  updateMinttyConfig "$CFGFILE" "$COLOR_04"         "Yellow"
  updateMinttyConfig "$CFGFILE" "$COLOR_05"         "Blue"
  updateMinttyConfig "$CFGFILE" "$COLOR_06"         "Magenta"
  updateMinttyConfig "$CFGFILE" "$COLOR_07"         "Cyan"
  updateMinttyConfig "$CFGFILE" "$COLOR_08"         "White"

  updateMinttyConfig "$CFGFILE" "$COLOR_09"         "BoldBlack"
  updateMinttyConfig "$CFGFILE" "$COLOR_10"         "BoldRed"
  updateMinttyConfig "$CFGFILE" "$COLOR_11"         "BoldGreen"
  updateMinttyConfig "$CFGFILE" "$COLOR_12"         "BoldYellow"
  updateMinttyConfig "$CFGFILE" "$COLOR_13"         "BoldBlue"
  updateMinttyConfig "$CFGFILE" "$COLOR_14"         "BoldMagenta"
  updateMinttyConfig "$CFGFILE" "$COLOR_15"         "BoldCyan"
  updateMinttyConfig "$CFGFILE" "$COLOR_16"         "BoldWhite"

  updateMinttyConfig "$CFGFILE" "$BACKGROUND_COLOR" "Backgroundcolor"
  updateMinttyConfig "$CFGFILE" "$FOREGROUND_COLOR" "Foregroundcolor"
  updateMinttyConfig "$CFGFILE" "$CURSOR_COLOR"     "Cursorcolor"

  echo "Done - please reopen your Cygwin terminal to see the changes"
}

apply_alacritty() {
  # |
  # | Applying values on Alacritty
  # | ===========================================

  json_str="\
  { \
    \"colors\": \
    {\
      \"primary\":\
      {\
        \"background\": \"$BACKGROUND_COLOR\",\
        \"foreground\": \"$FOREGROUND_COLOR\"\
      },\
      \"normal\":\
      {\
        \"black\": \"$COLOR_01\",\
        \"red\": \"$COLOR_02\",\
        \"green\": \"$COLOR_03\",\
        \"yellow\":\"$COLOR_04\",\
        \"blue\":\"$COLOR_05\",\
        \"magenta\": \"$COLOR_06\",\
        \"cyan\":\"$COLOR_07\",\
        \"white\": \"$COLOR_08\"\
      },\
      \"bright\":\
      {\
        \"black\":\"$COLOR_09\",\
        \"red\":\"$COLOR_10\",\
        \"green\":\"$COLOR_11\",\
        \"yellow\": \"$COLOR_12\",\
        \"blue\": \"$COLOR_13\",\
        \"magenta\":\"$COLOR_14\",\
        \"cyan\": \"$COLOR_15\",\
        \"white\":\"$COLOR_16\"\
      } \
    }\
  }"

  SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
  PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

  # Allow developer to change url to forked url for easier testing
  # IMPORTANT: Make sure you export this variable if your main shell is not bash
  BASE_URL=${BASE_URL:-"https://raw.githubusercontent.com/Mayccoll/Gogh/master"}


  if [[ -e "${SCRIPT_PATH}/apply-alacritty.py" ]]; then
    python3 "${SCRIPT_PATH}/apply-alacritty.py" "$json_str"
  else
    if [[ "$(uname)" = "Darwin" ]]; then
      # OSX ships with curl and ancient bash
      python3 -c "$(curl -so- "${BASE_URL}/apply-alacritty.py")" "$json_str"
    else
      # Linux ships with wget
      python3 -c "$(wget -qO- "${BASE_URL}/apply-alacritty.py")" "$json_str"
    fi
  fi

}

apply_foot() {
  # |
  # | Applying values on foot
  # | ===========================================

  echo "Patching foot configuration file (${CFGFILE}) with new colors..."

  updateFootConfig "$CFGFILE" "$COLOR_01" "regular0"
  updateFootConfig "$CFGFILE" "$COLOR_02" "regular1"
  updateFootConfig "$CFGFILE" "$COLOR_03" "regular2"
  updateFootConfig "$CFGFILE" "$COLOR_04" "regular3"
  updateFootConfig "$CFGFILE" "$COLOR_05" "regular4"
  updateFootConfig "$CFGFILE" "$COLOR_06" "regular5"
  updateFootConfig "$CFGFILE" "$COLOR_07" "regular6"
  updateFootConfig "$CFGFILE" "$COLOR_08" "regular7"

  updateFootConfig "$CFGFILE" "$COLOR_09" "bright0"
  updateFootConfig "$CFGFILE" "$COLOR_10" "bright1"
  updateFootConfig "$CFGFILE" "$COLOR_11" "bright2"
  updateFootConfig "$CFGFILE" "$COLOR_12" "bright3"
  updateFootConfig "$CFGFILE" "$COLOR_13" "bright4"
  updateFootConfig "$CFGFILE" "$COLOR_14" "bright5"
  updateFootConfig "$CFGFILE" "$COLOR_15" "bright6"
  updateFootConfig "$CFGFILE" "$COLOR_16" "bright7"

  updateFootConfig "$CFGFILE" "$BACKGROUND_COLOR" "background"
  updateFootConfig "$CFGFILE" "$FOREGROUND_COLOR" "foreground"

  echo "Done - please reopen your foot terminal to see the changes"

}

apply_kitty() {
  # |
  # | Applying values on Kitty
  # | ===========================================

  echo "Patching kitty configuration file ($CFGFILE) with include of color theme file..."

  COLOR_FILE="colors.conf"

  if ! grep -q "^include $COLOR_FILE$" "$CFGFILE" ; then
    echo "" >> "$CFGFILE"
    echo "# Added by Gogh" >> "$CFGFILE"
    echo "include $COLOR_FILE" >> "$CFGFILE"
  fi

  CFGFILE="${KITTY_CONFIG_DIRECTORY}/$COLOR_FILE"

  echo "Updating color theme file ($CFGFILE) with theme..."

  rm -f "$CFGFILE"

  echo "# Color theme: $PROFILE_NAME" >> "$CFGFILE"
  echo "# Auto-generated by Gogh (https://mayccoll.github.io/Gogh/)" >> "$CFGFILE"
  echo "" >> "$CFGFILE"
  echo "color0  $COLOR_01" >> "$CFGFILE"
  echo "color1  $COLOR_02" >> "$CFGFILE"
  echo "color2  $COLOR_03" >> "$CFGFILE"
  echo "color3  $COLOR_04" >> "$CFGFILE"
  echo "color4  $COLOR_05" >> "$CFGFILE"
  echo "color5  $COLOR_06" >> "$CFGFILE"
  echo "color6  $COLOR_07" >> "$CFGFILE"
  echo "color7  $COLOR_08" >> "$CFGFILE"
  echo "color8  $COLOR_09" >> "$CFGFILE"
  echo "color9  $COLOR_10" >> "$CFGFILE"
  echo "color10 $COLOR_11" >> "$CFGFILE"
  echo "color11 $COLOR_12" >> "$CFGFILE"
  echo "color12 $COLOR_13" >> "$CFGFILE"
  echo "color13 $COLOR_14" >> "$CFGFILE"
  echo "color14 $COLOR_15" >> "$CFGFILE"
  echo "color15 $COLOR_16" >> "$CFGFILE"

  echo "background $BACKGROUND_COLOR" >> "$CFGFILE"
  echo "foreground $FOREGROUND_COLOR" >> "$CFGFILE"

  [ -n "$HIGHLIGHT_FG_COLOR" ] && echo "selection_foreground $HIGHLIGHT_FG_COLOR" >> "$CFGFILE"
  [ -n "$HIGHLIGHT_BG_COLOR" ] && echo "selection_background $HIGHLIGHT_BG_COLOR" >> "$CFGFILE"

  echo "cursor $CURSOR_COLOR" >> "$CFGFILE"

  echo "Done - please reopen your kitty terminal to see the changes"
}

apply_konsole() {
  # |
  # | Applying values on Konsole
  # | ===========================================

  PARENT=$(grep -o "^DefaultProfile=.*$" ${CFGFILE} | cut -d '=' -f 2)
  if [[ -z "${PARENT}" ]]; then
    PARENT="FALLBACK/"
  fi

  if [[ -z "${XDG_DATA_HOME:-}" ]]; then
    KDIR="${HOME}/.local/share/konsole"
  else
	KDIR="${XDG_DATA_HOME}/konsole"
  fi

  KPROFILE="${KDIR}/${PROFILE_NAME}.profile"
  if [[ -f "${KPROFILE}" ]]; then
      echo "Profile ${PROFILE_NAME} already exists in Konsole confiuration (${KONSOLE_DIR}); Skipping ..."
      exit 0
  fi

  touch "${KPROFILE}"
  echo -e "[Appearance]\nColorScheme=${PROFILE_NAME}\n" >> "${KPROFILE}"
  echo -e "[General]\nName=${PROFILE_NAME}\nParent=$PARENT" >> "${KPROFILE}"

  KCOLORSCHEME="${KDIR}/${PROFILE_NAME}.colorscheme"
  if [[ -f "${KCOLORSCHEME}" ]]; then
      echo "Color Scheme ${PROFILE_NAME} already exists in Konsole confiuration (${KONSOLE_DIR}); Skipping ..."
      exit 0
  fi

  touch "${KCOLORSCHEME}"
  createKonsoleTriple "Background" "${BACKGROUND_COLOR}" "${BACKGROUND_COLOR}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color0" "${COLOR_01}" "${COLOR_09}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color1" "${COLOR_02}" "${COLOR_10}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color2" "${COLOR_03}" "${COLOR_11}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color3" "${COLOR_04}" "${COLOR_12}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color4" "${COLOR_05}" "${COLOR_13}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color5" "${COLOR_06}" "${COLOR_14}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color6" "${COLOR_07}" "${COLOR_15}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Color7" "${COLOR_08}" "${COLOR_16}" >> "${KCOLORSCHEME}"
  createKonsoleTriple "Foreground" "${FOREGROUND_COLOR}" "${FOREGROUND_COLOR}" >> "${KCOLORSCHEME}"
  echo "[General]" >> "${KCOLORSCHEME}"
  echo "Blur=false" >> "${KCOLORSCHEME}"
  echo "ColorRandomization=false" >> "${KCOLORSCHEME}"
  echo "Description=${PROFILE_NAME}" >> "${KCOLORSCHEME}"
  echo "Opacity=1" >> "${KCOLORSCHEME}"
  echo "Wallpaper=" >> "${KCOLORSCHEME}"
}

apply_darwin() {
  # |
  # | Applying values on iTerm2
  # | ===========================================

  BACKGROUND_COLOR=$(convertNameAndRGBtoITerm "Background Color" "$BACKGROUND_COLOR")
  FOREGROUND_COLOR=$(convertNameAndRGBtoITerm "Foreground Color" "$FOREGROUND_COLOR")
  COLOR_01=$(convertNameAndRGBtoITerm "Ansi 0 Color"             "$COLOR_01")
  COLOR_02=$(convertNameAndRGBtoITerm "Ansi 1 Color"             "$COLOR_02")
  COLOR_03=$(convertNameAndRGBtoITerm "Ansi 2 Color"             "$COLOR_03")
  COLOR_04=$(convertNameAndRGBtoITerm "Ansi 3 Color"             "$COLOR_04")
  COLOR_05=$(convertNameAndRGBtoITerm "Ansi 4 Color"             "$COLOR_05")
  COLOR_06=$(convertNameAndRGBtoITerm "Ansi 5 Color"             "$COLOR_06")
  COLOR_07=$(convertNameAndRGBtoITerm "Ansi 6 Color"             "$COLOR_07")
  COLOR_08=$(convertNameAndRGBtoITerm "Ansi 7 Color"             "$COLOR_08")
  COLOR_09=$(convertNameAndRGBtoITerm "Ansi 8 Color"             "$COLOR_09")
  COLOR_10=$(convertNameAndRGBtoITerm "Ansi 9 Color"             "$COLOR_10")
  COLOR_11=$(convertNameAndRGBtoITerm "Ansi 10 Color"            "$COLOR_11")
  COLOR_12=$(convertNameAndRGBtoITerm "Ansi 11 Color"            "$COLOR_12")
  COLOR_13=$(convertNameAndRGBtoITerm "Ansi 12 Color"            "$COLOR_13")
  COLOR_14=$(convertNameAndRGBtoITerm "Ansi 13 Color"            "$COLOR_14")
  COLOR_15=$(convertNameAndRGBtoITerm "Ansi 14 Color"            "$COLOR_15")
  COLOR_16=$(convertNameAndRGBtoITerm "Ansi 15 Color"            "$COLOR_16")

  # Assemble color scheme file contents
  ITERMCOLORS='<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><dict>'${BACKGROUND_COLOR}${FOREGROUND_COLOR}${COLOR_01}${COLOR_02}${COLOR_03}${COLOR_04}${COLOR_05}${COLOR_06}${COLOR_07}${COLOR_08}${COLOR_09}${COLOR_10}${COLOR_11}${COLOR_12}${COLOR_13}${COLOR_14}${COLOR_15}'</dict></plist>'

  # Dump iTerm color scheme to file and import it by opening it
  echo "${ITERMCOLORS}" > "${PROFILE_NAME}.itermcolors"
  open "${PROFILE_NAME}.itermcolors"
  rm   "${PROFILE_NAME}.itermcolors"
}

apply_gtk() {
  # |
  # | Applying values to gnome/mate/tilix
  # | ===========================================

  local legacy="${1:-}"

  # This is to avoid doing the profile loop definition twice
  if [[ -z "${legacy}" ]]; then
    CONFTOOL="${DCONF} read"
    VISIBLE_NAME="visible-name"
  else
    CONFTOOL="${GCONF} --get"
    VISIBLE_NAME="visible_name"
  fi

  # Check first wether profile already exists
  profile_hashes=($(${CONFTOOL} "${PROFILE_LIST_KEY}" | tr "[]'," " "))
  for profile in "${profile_hashes[@]}"; do
    if [[ "$(${CONFTOOL} "${BASE_DIR}${profile}/${VISIBLE_NAME}" | tr -d "'")" == "${PROFILE_NAME}" ]]; then
      printf '%s\n' "Profile already exists" "Skipping..."
      exit 0
    fi
  done

  # Fallback if there is no default profile
  set -- $(${CONFTOOL} ${PROFILE_LIST_KEY} | tr "[]'," " ")
  : ${DEFAULT_SLUG:="$1"}

  : ${PROFILE_NAME:="Default"}
  : ${PROFILE_SLUG:="Default"}

  DEFAULT_KEY="${BASE_DIR}${DEFAULT_SLUG:-}"
  PROFILE_KEY="${BASE_DIR}${PROFILE_SLUG:-}"

  if [[ -z "${legacy}" ]]; then
    if [[ -z "$(${DCONF} list ${BASE_DIR%:})" ]]; then
      # Provide a user friendly error text if no saved profile exists, otherwise it will display "Error gconftool not found!"
      #  it could happen on a newly installed system. (happened on CentOS 7)
      printf '%s\n'                                                                                             \
      "Error, no saved profiles found!"                                                                         \
      "Possible fix, new a profile (Terminal > Edit > Preferences > Profiles > New, then Close) and try again." \
      "You can safely delete the created profile after the installation."
      exit 1
    fi

    BACKGROUND_COLOR=$(gnome_color "$BACKGROUND_COLOR")
    FOREGROUND_COLOR=$(gnome_color "$FOREGROUND_COLOR")
    CURSOR_COLOR=$(gnome_color "$CURSOR_COLOR")
    HIGHLIGHT_BG_COLOR=$(gnome_color "$HIGHLIGHT_BG_COLOR")
    HIGHLIGHT_FG_COLOR=$(gnome_color "$HIGHLIGHT_FG_COLOR")
    COLOR_01=$(gnome_color         "$COLOR_01")
    COLOR_02=$(gnome_color         "$COLOR_02")
    COLOR_03=$(gnome_color         "$COLOR_03")
    COLOR_04=$(gnome_color         "$COLOR_04")
    COLOR_05=$(gnome_color         "$COLOR_05")
    COLOR_06=$(gnome_color         "$COLOR_06")
    COLOR_07=$(gnome_color         "$COLOR_07")
    COLOR_08=$(gnome_color         "$COLOR_08")
    COLOR_09=$(gnome_color         "$COLOR_09")
    COLOR_10=$(gnome_color         "$COLOR_10")
    COLOR_11=$(gnome_color         "$COLOR_11")
    COLOR_12=$(gnome_color         "$COLOR_12")
    COLOR_13=$(gnome_color         "$COLOR_13")
    COLOR_14=$(gnome_color         "$COLOR_14")
    COLOR_15=$(gnome_color         "$COLOR_15")
    COLOR_16=$(gnome_color         "$COLOR_16")

    # copy existing settings from default profile
    $DCONF dump               "${DEFAULT_KEY}/" | $DCONF load "${PROFILE_KEY}/"

    # add new copy to global list of profiles
    dlist_append              "${PROFILE_LIST_KEY}" "${PROFILE_SLUG#:}"

    set_theme
    dset palette              "${LEFT_WRAPPER:-}'${COLOR_01}${PALETTE_DELIM}${COLOR_02}${PALETTE_DELIM}${COLOR_03}${PALETTE_DELIM}${COLOR_04}${PALETTE_DELIM}${COLOR_05}${PALETTE_DELIM}${COLOR_06}${PALETTE_DELIM}${COLOR_07}${PALETTE_DELIM}${COLOR_08}${PALETTE_DELIM}${COLOR_09}${PALETTE_DELIM}${COLOR_10}${PALETTE_DELIM}${COLOR_11}${PALETTE_DELIM}${COLOR_12}${PALETTE_DELIM}${COLOR_13}${PALETTE_DELIM}${COLOR_14}${PALETTE_DELIM}${COLOR_15}${PALETTE_DELIM}${COLOR_16}'${RIGHT_WRAPPER:-}"
    ${LEGACY_BOLD:-} && dset allow-bold "true" # mate
  else
    # Append the Base16 profile to the profile list
    glist_append string       "${PROFILE_LIST_KEY}" "${PROFILE_SLUG}"

    legacy_set_theme
    gcset string palette      "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
    ${LEGACY_BOLD:-} && gcset bool allow-bold "true"
  fi
}

apply_guake() {
  # |
  # | Applying values to guake
  # | ===========================================

  local legacy="${1:-}"
  PROFILE_KEY="/apps/guake/style/font"

  if [[ -z "${legacy}" ]]; then
    dset palette              "'${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}:${FOREGROUND_COLOR}:${BACKGROUND_COLOR}'"
    dset palette-name         "'${PROFILE_NAME}'"
    dset allow-bold 'true'
  else
    gcset string color        "${FOREGROUND_COLOR}"
    gcset string palette      "${COLOR_01}:${COLOR_02}:${COLOR_03}:${COLOR_04}:${COLOR_05}:${COLOR_06}:${COLOR_07}:${COLOR_08}:${COLOR_09}:${COLOR_10}:${COLOR_11}:${COLOR_12}:${COLOR_13}:${COLOR_14}:${COLOR_15}:${COLOR_16}"
    gcset string palette-name "${PROFILE_NAME}"
    PROFILE_KEY="/apps/guake/style/background"
    gcset string color        "${BACKGROUND_COLOR}"

  fi
}

appy_tilixschemes() {
  # |
  # | Applying values to tilix colorschemes
  # | ===========================================

  if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
    [[ -d "${HOME}/.config/tilix/schemes" ]] || mkdir -p "${HOME}/.config/tilix/schemes"

    TILIXCOLORS='{\n\t"name": "'${PROFILE_NAME}'",\n\t"comment": "Generated by Gogh",\n\t"foreground-color": "'${FOREGROUND_COLOR}'",\n\t"background-color":"'${BACKGROUND_COLOR}'",\n\t"cursor-background-color": "'${CURSOR_COLOR}'",\n\t"palette": [\n\t\t"'${COLOR_01}'",\n\t\t"'${COLOR_02}'",\n\t\t"'${COLOR_03}'",\n\t\t"'${COLOR_04}'",\n\t\t"'${COLOR_05}'",\n\t\t"'${COLOR_06}'",\n\t\t"'${COLOR_07}'",\n\t\t"'${COLOR_08}'",\n\t\t"'${COLOR_09}'",\n\t\t"'${COLOR_10}'",\n\t\t"'${COLOR_11}'",\n\t\t"'${COLOR_12}'",\n\t\t"'${COLOR_13}'",\n\t\t"'${COLOR_14}'",\n\t\t"'${COLOR_15}'",\n\t\t"'${COLOR_16}'"\n\t],\n\t"use-badge-color": false,\n\t"use-bold-color": false,\n\t"use-cursor-color": false,\n\t"use-highlight-color": false,\n\t"use-theme-colors": false\n}'
    echo -e "${TILIXCOLORS}" > "${scratchdir}/${PROFILE_NAME}.json"

    # Note: Tilix does not store color scheme name in dconf
    # so we have to update color palette for the current profile in order to switch to the new theme
    # but only set the palette on the last loop to avoid a flashing terminal
    if ((LOOP == OPTLENGTH)); then
      cp -f  ${scratchdir}/* "$HOME/.config/tilix/schemes/"
      rm -rf "${scratchdir}"
      read -r -p "All done - apply new theme? [y/N] " -n 1 TILIX_RES
      if [[ ${TILIX_RES::1} =~ ^(y|Y)$ ]]; then
        PROFILE_KEY="${BASE_DIR}${DEFAULT_SLUG}"
        PROFILE_NAME="$(${DCONF} read ${PROFILE_KEY}/visible-name | tr -d \')"
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

apply_xfce4-terminal() {
    # XFCE4 terminal has no profiles, instead it uses color presets
    SCHEMEDIR="${HOME}/.local/share/xfce4/terminal/colorschemes"
    CONFFILE="${HOME}/.config/xfce4/terminal/terminalrc"

    if [[ ! (-w "${CONFFILE}") ]]; then
        if [[ -r "${XDG_CONFIG_DIRS%%:*}/Terminal/terminalrc" ]]; then
            cp "${XDG_CONFIG_DIRS%%:*}/Terminal/terminalrc" ${CONFFILE}
        else
            echo "ERROR: config file not present or not writable!"
            exit 1
        fi
    fi

    [[ -d "${SCHEMEDIR}" ]] || mkdir -p "${SCHEMEDIR}"

    F_NAME=${PROFILE_NAME// /-}
    F_NAME=$(echo ${F_NAME} | tr -d ":()")
    F_NAME=$(echo "${F_NAME}" | awk '{print tolower($0)}')

    FF_NAME="${SCHEMEDIR}/${F_NAME}.theme"

    touch "${FF_NAME}"

    L_COLORCURSOR="ColorCursor=${CURSOR_COLOR}"
    L_COLORPALETTE="ColorPalette=${COLOR_01};${COLOR_02};${COLOR_03};${COLOR_04};${COLOR_05};${COLOR_06};${COLOR_07};${COLOR_08};${COLOR_09};${COLOR_10};${COLOR_11};${COLOR_12};${COLOR_13};${COLOR_14};${COLOR_15};${COLOR_16}"

    printf '%s\n' \
        "; Generated by Gogh" \
        "; https://mayccoll.github.io/Gogh" \
        "[Scheme]" \
        "Name=${PROFILE_NAME}" \
        "ColorForeground=${FOREGROUND_COLOR}" \
        "ColorBackground=${BACKGROUND_COLOR}" \
        "${L_COLORCURSOR}" \
        "${L_COLORPALETTE}" \
        "ColorCursorUseDefault=FALSE" > ${FF_NAME}

    # apply last theme in queue
    # xfce4-terminal monitors its rc file and doesn't reference
    # any of the themes in there. The color settings need to
    # be written there directly.
    if ((LOOP == OPTLENGTH)); then
        read -r -p "All done - apply new theme? [y/N] " -n 1 XFCE4_APPLY_CURR_THEME
        if [[ ${XFCE4_APPLY_CURR_THEME::1} =~ ^(y|Y)$ ]]; then
            if grep -q "^ColorPalette=" "${CONFFILE}"; then
                sed -i -r -e "s/^ColorPalette=.*/${L_COLORPALETTE}/" "${CONFFILE}"
            else
                echo "${L_COLORPALETTE}" >> "${CONFFILE}"
            fi

            if grep -q "^ColorCursor=" "${CONFFILE}"; then
                sed -i -r -e "s/^ColorCursor=.*/${L_COLORCURSOR}/" "${CONFFILE}"
            else
                echo "${L_COLORCURSOR}" >> "${CONFFILE}"
            fi

            if grep -q "^ColorForeground=" "${CONFFILE}"; then
                sed -i -r -e "s/^ColorForeground=.*/ColorForeground=${FOREGROUND_COLOR}/" "${CONFFILE}"
            else
                echo "ColorForeground=${FOREGROUND_COLOR}" >> "${CONFFILE}"
            fi

            if grep -q "^ColorBackground=" "${CONFFILE}"; then
                sed -i -r -e "s/^ColorBackground=.*/ColorBackground=${BACKGROUND_COLOR}/" "${CONFFILE}"
            else
                echo "ColorBackground=${BACKGROUND_COLOR}" >> "${CONFFILE}"
            fi

            if grep -q "^ColorCursorUseDefault=FALSE" "${CONFFILE}"; then
                true
            else
                echo "ColorCursorUseDefault=FALSE" >> "${CONFFILE}"
            fi
        fi
    fi

    unset SCHEMEDIR
    unset CONFFILE
    unset PROFILE_NAME
    unset F_NAME
    unset FF_NAME
    unset L_COLORCURSOR
    unset L_COLORPALETTE
    exit 0
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

  guake )
    if [[ -n "$(${DCONF} list /apps/guake/style/)" ]]; then
      apply_guake
    else
      apply_guake legacy
    fi
    ;;

  gnome-terminal* )
    if [[ -n "$(${DCONF} list /org/gnome/terminal/)" ]]; then
      BASE_DIR="/org/gnome/terminal/legacy/profiles:/:"
      PROFILE_LIST_KEY="${BASE_DIR%:}list"
      PROFILE_SLUG="${PROFILE_SLUG}"

      # Note -- ${BASE_DIR%s} is a workaround to avoid doing additional conditional testing for existing profiles
      # if terminal is set to gnome-terminal
      : ${DEFAULT_SLUG:="$(${DCONF} read ${BASE_DIR%:}default | tr -d \')"}

      LEFT_WRAPPER="["
      RIGHT_WRAPPER="]"
      PALETTE_DELIM="', '"

      apply_gtk
    else
      BASE_DIR="/apps/gnome-terminal/profiles/"
      PROFILE_LIST_KEY="${BASE_DIR/profiles/global}profile_list"
      LEGACY_BOLD=true

      : ${DEFAULT_SLUG:="$(${GCONF} read ${BASE_DIR}default_profile)"}

      apply_gtk legacy
    fi
    ;;

  mate-terminal )
    BASE_DIR="/org/mate/terminal/profiles/"
    PROFILE_LIST_KEY="${BASE_DIR/profiles/global}profile-list"
    LEGACY_BOLD=true

    : ${DEFAULT_SLUG:="$(${DCONF} read ${BASE_DIR/profiles/global}default-profile | tr -d \')"}

    PALETTE_DELIM=":"

    apply_gtk
    ;;

  tilix )
    BASE_DIR="/com/gexperts/Tilix/profiles/"
    PROFILE_LIST_KEY="${BASE_DIR}list"

    : ${DEFAULT_SLUG:="$(${DCONF} read ${BASE_DIR}default | tr -d \')"}

    LEFT_WRAPPER="["
    RIGHT_WRAPPER="]"
    PALETTE_DELIM="', '"

    appy_tilixschemes
    apply_gtk
    ;;

  xfce4-terminal )
    apply_xfce4-terminal
    ;;

  alacritty )
    apply_alacritty
    ;;

  foot )
    apply_foot
    ;;

  kitty )
    apply_kitty
    ;;

  konsole )
    apply_konsole
    ;;

  * )
    printf '%s\n'                                             \
    "Unsupported terminal!"                                   \
    ""                                                        \
    "Supported terminals:"                                    \
    "   mintty and deriviates"                                \
    "   guake"                                                \
    "   iTerm2"                                               \
    "   elementary terminal (pantheon/elementary)"            \
    "   mate-terminal"                                        \
    "   gnome-terminal"                                       \
    "   tilix"                                                \
    "   xfce4-terminal"                                       \
    "   foot"                                                 \
    "   kitty"                                                \
    "   konsole"                                              \
    ""                                                        \
    "If you believe you have recieved this message in error," \
    "try manually setting \`TERMINAL', hint: ps -h -o comm -p \$PPID"
    exit 1
    ;;

esac

unset PROFILE_NAME
unset PROFILE_SLUG
unset DEFAULT_SLUG
