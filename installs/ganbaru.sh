#!/usr/bin/env bash

export PROFILE_NAME="Ganbaru"

export COLOR_01="#151B24"           # Black (Host)
export COLOR_02="#E8608C"           # Red (Syntax string)
export COLOR_03="#A2D37E"           # Green (Command)
export COLOR_04="#FFB270"           # Yellow (Command second)
export COLOR_05="#73B3FF"           # Blue (Path)
export COLOR_06="#B8ABEC"           # Magenta (Syntax var)
export COLOR_07="#60CEE0"           # Cyan (Prompt)
export COLOR_08="#A8ADB7"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF6D7E"           # Bright Red (Command error)
export COLOR_11="#B1E397"           # Bright Green (Exec)
export COLOR_12="#E5DE8C"           # Bright Yellow
export COLOR_13="#A2C8F5"           # Bright Blue (Folder)
export COLOR_14="#ECAEE3"           # Bright Magenta
export COLOR_15="#A8D9E1"           # Bright Cyan
export COLOR_16="#D1D8E5"           # Bright White

export BACKGROUND_COLOR="#151B24"   # Background
export FOREGROUND_COLOR="#E1E5EC"   # Foreground (Text)

export CURSOR_COLOR="#E1E5EC" # Cursor

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
