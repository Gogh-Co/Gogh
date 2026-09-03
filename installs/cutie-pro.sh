#!/usr/bin/env bash

export PROFILE_NAME="Cutie Pro"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F56E7F"           # Red (Syntax string)
export COLOR_03="#BEC975"           # Green (Command)
export COLOR_04="#F58669"           # Yellow (Command second)
export COLOR_05="#42D9C5"           # Blue (Path)
export COLOR_06="#D286B7"           # Magenta (Syntax var)
export COLOR_07="#37CB8A"           # Cyan (Prompt)
export COLOR_08="#D5C3C3"           # White

export COLOR_09="#88847F"           # Bright Black
export COLOR_10="#E5A1A3"           # Bright Red (Command error)
export COLOR_11="#E8D6A7"           # Bright Green (Exec)
export COLOR_12="#F1BB79"           # Bright Yellow
export COLOR_13="#80C5DE"           # Bright Blue (Folder)
export COLOR_14="#B294BB"           # Bright Magenta
export COLOR_15="#9DCCBB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#181818"   # Background
export FOREGROUND_COLOR="#D5D0C9"   # Foreground (Text)

export CURSOR_COLOR="#EFC4CD" # Cursor

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
