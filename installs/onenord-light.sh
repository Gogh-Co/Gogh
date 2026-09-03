#!/usr/bin/env bash

export PROFILE_NAME="Onenord Light"

export COLOR_01="#2E3440"           # Black (Host)
export COLOR_02="#CB4F53"           # Red (Syntax string)
export COLOR_03="#48A53D"           # Green (Command)
export COLOR_04="#EE5E25"           # Yellow (Command second)
export COLOR_05="#3879C5"           # Blue (Path)
export COLOR_06="#9F4ACA"           # Magenta (Syntax var)
export COLOR_07="#3EA1AD"           # Cyan (Prompt)
export COLOR_08="#E5E9F0"           # White

export COLOR_09="#646A76"           # Bright Black
export COLOR_10="#D16366"           # Bright Red (Command error)
export COLOR_11="#5F9E9D"           # Bright Green (Exec)
export COLOR_12="#BA793E"           # Bright Yellow
export COLOR_13="#1B40A6"           # Bright Blue (Folder)
export COLOR_14="#9665AF"           # Bright Magenta
export COLOR_15="#8FBCBB"           # Bright Cyan
export COLOR_16="#ECEFF4"           # Bright White

export BACKGROUND_COLOR="#F7F8FA"   # Background
export FOREGROUND_COLOR="#2E3440"   # Foreground (Text)

export CURSOR_COLOR="#3879C5" # Cursor

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
