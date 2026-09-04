#!/usr/bin/env bash

export PROFILE_NAME="Standardized Dark"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#E15D67"           # Red (Syntax string)
export COLOR_03="#5DB129"           # Green (Command)
export COLOR_04="#E1B31A"           # Yellow (Command second)
export COLOR_05="#00A3F2"           # Blue (Path)
export COLOR_06="#B46EE0"           # Magenta (Syntax var)
export COLOR_07="#21C992"           # Cyan (Prompt)
export COLOR_08="#C0C0C0"           # White

export COLOR_09="#898989"           # Bright Black
export COLOR_10="#E15D67"           # Bright Red (Command error)
export COLOR_11="#5DB129"           # Bright Green (Exec)
export COLOR_12="#E1B31A"           # Bright Yellow
export COLOR_13="#00A3F2"           # Bright Blue (Folder)
export COLOR_14="#B46EE0"           # Bright Magenta
export COLOR_15="#21C992"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#C0C0C0"   # Foreground (Text)

export CURSOR_COLOR="#C0C0C0" # Cursor

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
