#!/usr/bin/env bash

export PROFILE_NAME="Precious Light Warm"

export COLOR_01="#FFF5E5"           # Black (Host)
export COLOR_02="#B14745"           # Red (Syntax string)
export COLOR_03="#557300"           # Green (Command)
export COLOR_04="#876500"           # Yellow (Command second)
export COLOR_05="#246DA5"           # Blue (Path)
export COLOR_06="#7A50C6"           # Magenta (Syntax var)
export COLOR_07="#0E7767"           # Cyan (Prompt)
export COLOR_08="#4E5359"           # White

export COLOR_09="#7F8080"           # Bright Black
export COLOR_10="#B14745"           # Bright Red (Command error)
export COLOR_11="#557300"           # Bright Green (Exec)
export COLOR_12="#876500"           # Bright Yellow
export COLOR_13="#246DA5"           # Bright Blue (Folder)
export COLOR_14="#7A50C6"           # Bright Magenta
export COLOR_15="#0E7767"           # Bright Cyan
export COLOR_16="#4E5359"           # Bright White

export BACKGROUND_COLOR="#FFF5E5"   # Background
export FOREGROUND_COLOR="#4E5359"   # Foreground (Text)

export CURSOR_COLOR="#4E5359" # Cursor

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
