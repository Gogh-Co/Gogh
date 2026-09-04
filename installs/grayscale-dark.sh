#!/usr/bin/env bash

export PROFILE_NAME="Grayscale Dark"

export COLOR_01="#101010"           # Black (Host)
export COLOR_02="#7C7C7C"           # Red (Syntax string)
export COLOR_03="#8E8E8E"           # Green (Command)
export COLOR_04="#A0A0A0"           # Yellow (Command second)
export COLOR_05="#686868"           # Blue (Path)
export COLOR_06="#747474"           # Magenta (Syntax var)
export COLOR_07="#868686"           # Cyan (Prompt)
export COLOR_08="#B9B9B9"           # White

export COLOR_09="#525252"           # Bright Black
export COLOR_10="#7C7C7C"           # Bright Red (Command error)
export COLOR_11="#8E8E8E"           # Bright Green (Exec)
export COLOR_12="#A0A0A0"           # Bright Yellow
export COLOR_13="#686868"           # Bright Blue (Folder)
export COLOR_14="#747474"           # Bright Magenta
export COLOR_15="#868686"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#101010"   # Background
export FOREGROUND_COLOR="#B9B9B9"   # Foreground (Text)

export CURSOR_COLOR="#B9B9B9" # Cursor

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
