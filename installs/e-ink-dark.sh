#!/usr/bin/env bash

export PROFILE_NAME="E Ink Dark"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#CCCCCC"           # Red (Syntax string)
export COLOR_03="#686868"           # Green (Command)
export COLOR_04="#7C7C7C"           # Yellow (Command second)
export COLOR_05="#868686"           # Blue (Path)
export COLOR_06="#5E5E5E"           # Magenta (Syntax var)
export COLOR_07="#B8B8B8"           # Cyan (Prompt)
export COLOR_08="#A4A4A4"           # White

export COLOR_09="#A4A4A4"           # Bright Black
export COLOR_10="#CCCCCC"           # Bright Red (Command error)
export COLOR_11="#686868"           # Bright Green (Exec)
export COLOR_12="#7C7C7C"           # Bright Yellow
export COLOR_13="#868686"           # Bright Blue (Folder)
export COLOR_14="#5E5E5E"           # Bright Magenta
export COLOR_15="#B8B8B8"           # Bright Cyan
export COLOR_16="#868686"           # Bright White

export BACKGROUND_COLOR="#333333"   # Background
export FOREGROUND_COLOR="#C2C2C2"   # Foreground (Text)

export CURSOR_COLOR="#C2C2C2" # Cursor

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
