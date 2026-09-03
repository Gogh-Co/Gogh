#!/usr/bin/env bash

export PROFILE_NAME="Flat"

export COLOR_01="#222D3F"           # Black (Host)
export COLOR_02="#A82320"           # Red (Syntax string)
export COLOR_03="#32A548"           # Green (Command)
export COLOR_04="#E58D11"           # Yellow (Command second)
export COLOR_05="#3167AC"           # Blue (Path)
export COLOR_06="#781AA0"           # Magenta (Syntax var)
export COLOR_07="#2C9370"           # Cyan (Prompt)
export COLOR_08="#B0B6BA"           # White

export COLOR_09="#212C3C"           # Bright Black
export COLOR_10="#D4312E"           # Bright Red (Command error)
export COLOR_11="#2D9440"           # Bright Green (Exec)
export COLOR_12="#E5BE0C"           # Bright Yellow
export COLOR_13="#3C7DD2"           # Bright Blue (Folder)
export COLOR_14="#8230A7"           # Bright Magenta
export COLOR_15="#35B387"           # Bright Cyan
export COLOR_16="#E7ECED"           # Bright White

export BACKGROUND_COLOR="#002240"   # Background
export FOREGROUND_COLOR="#2CC55D"   # Foreground (Text)

export CURSOR_COLOR="#E5BE0C" # Cursor

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
