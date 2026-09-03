#!/usr/bin/env bash

export PROFILE_NAME="Tango Half Adapted"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#4CC300"           # Green (Command)
export COLOR_04="#E2C000"           # Yellow (Command second)
export COLOR_05="#008EF6"           # Blue (Path)
export COLOR_06="#A96CB3"           # Magenta (Syntax var)
export COLOR_07="#00BDC3"           # Cyan (Prompt)
export COLOR_08="#E0E5DB"           # White

export COLOR_09="#797D76"           # Bright Black
export COLOR_10="#FF0013"           # Bright Red (Command error)
export COLOR_11="#8AF600"           # Bright Green (Exec)
export COLOR_12="#FFEC00"           # Bright Yellow
export COLOR_13="#76BFFF"           # Bright Blue (Folder)
export COLOR_14="#D898D1"           # Bright Magenta
export COLOR_15="#00F6FA"           # Bright Cyan
export COLOR_16="#F4F4F2"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
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
