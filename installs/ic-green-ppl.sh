#!/usr/bin/env bash

export PROFILE_NAME="IC Green PPL"

export COLOR_01="#014401"           # Black (Host)
export COLOR_02="#FF2736"           # Red (Syntax string)
export COLOR_03="#41A638"           # Green (Command)
export COLOR_04="#76A831"           # Yellow (Command second)
export COLOR_05="#2EC3B9"           # Blue (Path)
export COLOR_06="#50A096"           # Magenta (Syntax var)
export COLOR_07="#3CA078"           # Cyan (Prompt)
export COLOR_08="#E6FEF2"           # White

export COLOR_09="#035C03"           # Bright Black
export COLOR_10="#B4FA5C"           # Bright Red (Command error)
export COLOR_11="#AEFB86"           # Bright Green (Exec)
export COLOR_12="#DAFA87"           # Bright Yellow
export COLOR_13="#2EFAEB"           # Bright Blue (Folder)
export COLOR_14="#50FAFA"           # Bright Magenta
export COLOR_15="#3CFAC8"           # Bright Cyan
export COLOR_16="#E0F1DC"           # Bright White

export BACKGROUND_COLOR="#2C2C2C"   # Background
export FOREGROUND_COLOR="#E0F1DC"   # Foreground (Text)

export CURSOR_COLOR="#47FA6B" # Cursor

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
