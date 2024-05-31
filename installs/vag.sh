#!/usr/bin/env bash

export PROFILE_NAME="Vag"

export COLOR_01="#303030"           # Black (Host)
export COLOR_02="#A87139"           # Red (Syntax string)
export COLOR_03="#39A871"           # Green (Command)
export COLOR_04="#71A839"           # Yellow (Command second)
export COLOR_05="#7139A8"           # Blue (Path)
export COLOR_06="#A83971"           # Magenta (Syntax var)
export COLOR_07="#3971A8"           # Cyan (Prompt)
export COLOR_08="#8A8A8A"           # White

export COLOR_09="#494949"           # Bright Black
export COLOR_10="#B0763B"           # Bright Red (Command error)
export COLOR_11="#3BB076"           # Bright Green (Exec)
export COLOR_12="#76B03B"           # Bright Yellow
export COLOR_13="#763BB0"           # Bright Blue (Folder)
export COLOR_14="#B03B76"           # Bright Magenta
export COLOR_15="#3B76B0"           # Bright Cyan
export COLOR_16="#CFCFCF"           # Bright White

export BACKGROUND_COLOR="#191F1D"   # Background
export FOREGROUND_COLOR="#D9E6F2"   # Foreground (Text)

export CURSOR_COLOR="#D9E6F2" # Cursor

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
