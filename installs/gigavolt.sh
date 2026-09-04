#!/usr/bin/env bash

export PROFILE_NAME="Gigavolt"

export COLOR_01="#202126"           # Black (Host)
export COLOR_02="#FF661A"           # Red (Syntax string)
export COLOR_03="#F2E6A9"           # Green (Command)
export COLOR_04="#FFDC2D"           # Yellow (Command second)
export COLOR_05="#40BFFF"           # Blue (Path)
export COLOR_06="#AE94F9"           # Magenta (Syntax var)
export COLOR_07="#FB6ACB"           # Cyan (Prompt)
export COLOR_08="#E9E7E1"           # White

export COLOR_09="#A1D2E6"           # Bright Black
export COLOR_10="#FF661A"           # Bright Red (Command error)
export COLOR_11="#F2E6A9"           # Bright Green (Exec)
export COLOR_12="#FFDC2D"           # Bright Yellow
export COLOR_13="#40BFFF"           # Bright Blue (Folder)
export COLOR_14="#AE94F9"           # Bright Magenta
export COLOR_15="#FB6ACB"           # Bright Cyan
export COLOR_16="#F2FBFF"           # Bright White

export BACKGROUND_COLOR="#202126"   # Background
export FOREGROUND_COLOR="#E9E7E1"   # Foreground (Text)

export CURSOR_COLOR="#E9E7E1" # Cursor

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
