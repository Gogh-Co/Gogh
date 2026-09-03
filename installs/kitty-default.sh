#!/usr/bin/env bash

export PROFILE_NAME="Kitty Default"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC0403"           # Red (Syntax string)
export COLOR_03="#19CB00"           # Green (Command)
export COLOR_04="#CECB00"           # Yellow (Command second)
export COLOR_05="#0D73CC"           # Blue (Path)
export COLOR_06="#CB1ED1"           # Magenta (Syntax var)
export COLOR_07="#0DCDCD"           # Cyan (Prompt)
export COLOR_08="#DDDDDD"           # White

export COLOR_09="#767676"           # Bright Black
export COLOR_10="#F2201F"           # Bright Red (Command error)
export COLOR_11="#23FD00"           # Bright Green (Exec)
export COLOR_12="#FFFD00"           # Bright Yellow
export COLOR_13="#1A8FFF"           # Bright Blue (Folder)
export COLOR_14="#FD28FF"           # Bright Magenta
export COLOR_15="#14FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#DDDDDD"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
