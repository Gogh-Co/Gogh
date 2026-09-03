#!/usr/bin/env bash

export PROFILE_NAME="Paper"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC3E28"           # Red (Syntax string)
export COLOR_03="#216609"           # Green (Command)
export COLOR_04="#B58900"           # Yellow (Command second)
export COLOR_05="#1E6FCC"           # Blue (Path)
export COLOR_06="#5C21A5"           # Magenta (Syntax var)
export COLOR_07="#158C86"           # Cyan (Prompt)
export COLOR_08="#AAAAAA"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#CC3E28"           # Bright Red (Command error)
export COLOR_11="#216609"           # Bright Green (Exec)
export COLOR_12="#B58900"           # Bright Yellow
export COLOR_13="#1E6FCC"           # Bright Blue (Folder)
export COLOR_14="#5C21A5"           # Bright Magenta
export COLOR_15="#158C86"           # Bright Cyan
export COLOR_16="#AAAAAA"           # Bright White

export BACKGROUND_COLOR="#F2EEDE"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
