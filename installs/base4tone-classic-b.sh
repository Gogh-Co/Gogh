#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic B"

export COLOR_01="#211E1C"           # Black (Host)
export COLOR_02="#669F04"           # Red (Syntax string)
export COLOR_03="#DE5745"           # Green (Command)
export COLOR_04="#F18C7E"           # Yellow (Command second)
export COLOR_05="#E78B55"           # Blue (Path)
export COLOR_06="#C1AA15"           # Magenta (Syntax var)
export COLOR_07="#E97263"           # Cyan (Prompt)
export COLOR_08="#EEEAE8"           # White

export COLOR_09="#0D0907"           # Bright Black
export COLOR_10="#8BCF17"           # Bright Red (Command error)
export COLOR_11="#F39C91"           # Bright Green (Exec)
export COLOR_12="#FBBAB1"           # Bright Yellow
export COLOR_13="#F7CDB6"           # Bright Blue (Folder)
export COLOR_14="#DCC218"           # Bright Magenta
export COLOR_15="#F5C1A3"           # Bright Cyan
export COLOR_16="#F9F7F6"           # Bright White

export BACKGROUND_COLOR="#211E1C"   # Background
export FOREGROUND_COLOR="#A29790"   # Foreground (Text)

export CURSOR_COLOR="#847371" # Cursor

apply_theme() {
    if [[ -e "${GOGH_APPLY_SCRIPT}" ]]; then
      bash "${GOGH_APPLY_SCRIPT}"
    elif [[ -e "${PARENT_PATH}/apply-colors.sh" ]]; then
      bash "${PARENT_PATH}/apply-colors.sh"
    elif [[ -e "${SCRIPT_PATH}/apply-colors.sh" ]]; then
      bash "${SCRIPT_PATH}/apply-colors.sh"
    else
      printf '\n%s\n' "Error: Couldn't find apply-colors.sh" 1>&2
      exit 1
    fi
}

# | ===========================================================================
# | Apply Colors
# | ===========================================================================
SCRIPT_PATH="${SCRIPT_PATH:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
PARENT_PATH="$(dirname "${SCRIPT_PATH}")"

if [ -z "${GOGH_NONINTERACTIVE+no}" ]; then
    apply_theme
else
    apply_theme 1>/dev/null
fi
