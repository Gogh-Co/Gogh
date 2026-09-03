#!/usr/bin/env bash

export PROFILE_NAME="Adventure"

export COLOR_01="#040404"           # Black (Host)
export COLOR_02="#D84A33"           # Red (Syntax string)
export COLOR_03="#5DA602"           # Green (Command)
export COLOR_04="#EEBB6E"           # Yellow (Command second)
export COLOR_05="#417AB3"           # Blue (Path)
export COLOR_06="#E5C499"           # Magenta (Syntax var)
export COLOR_07="#BDCFE5"           # Cyan (Prompt)
export COLOR_08="#DBDED8"           # White

export COLOR_09="#685656"           # Bright Black
export COLOR_10="#D76B42"           # Bright Red (Command error)
export COLOR_11="#99B52C"           # Bright Green (Exec)
export COLOR_12="#FFB670"           # Bright Yellow
export COLOR_13="#97D7EF"           # Bright Blue (Folder)
export COLOR_14="#AA7900"           # Bright Magenta
export COLOR_15="#BDCFE5"           # Bright Cyan
export COLOR_16="#E4D5C7"           # Bright White

export BACKGROUND_COLOR="#040404"   # Background
export FOREGROUND_COLOR="#FEFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FEFFFF" # Cursor

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
