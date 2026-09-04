#!/usr/bin/env bash

export PROFILE_NAME="Chalkby"

export COLOR_01="#2E3436"           # Black (Host)
export COLOR_02="#FFB0B0"           # Red (Syntax string)
export COLOR_03="#C8FF9B"           # Green (Command)
export COLOR_04="#FFFCA4"           # Yellow (Command second)
export COLOR_05="#6F9CEB"           # Blue (Path)
export COLOR_06="#9395D3"           # Magenta (Syntax var)
export COLOR_07="#BDEAFF"           # Cyan (Prompt)
export COLOR_08="#D3D7CF"           # White

export COLOR_09="#555753"           # Bright Black
export COLOR_10="#FFB0B0"           # Bright Red (Command error)
export COLOR_11="#C8FF9B"           # Bright Green (Exec)
export COLOR_12="#FFFCA4"           # Bright Yellow
export COLOR_13="#6F9CEB"           # Bright Blue (Folder)
export COLOR_14="#9395D3"           # Bright Magenta
export COLOR_15="#BDEAFF"           # Bright Cyan
export COLOR_16="#EEEEEC"           # Bright White

export BACKGROUND_COLOR="#1F2D2D"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
