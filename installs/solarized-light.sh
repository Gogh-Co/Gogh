#!/usr/bin/env bash

export PROFILE_NAME="Solarized Light"

export COLOR_01="#EEE8D5"           # Black (Host)
export COLOR_02="#DC322F"           # Red (Syntax string)
export COLOR_03="#859900"           # Green (Command)
export COLOR_04="#B58900"           # Yellow (Command second)
export COLOR_05="#268BD2"           # Blue (Path)
export COLOR_06="#D33682"           # Magenta (Syntax var)
export COLOR_07="#2AA198"           # Cyan (Prompt)
export COLOR_08="#002B36"           # White

export COLOR_09="#657b83"           # Bright Black
export COLOR_10="#CB4B16"           # Bright Red (Command error)
export COLOR_11="#859900"           # Bright Green (Exec)
export COLOR_12="#B58900"           # Bright Yellow
export COLOR_13="#6C71C4"           # Bright Blue (Folder)
export COLOR_14="#D33682"           # Bright Magenta
export COLOR_15="#2AA198"           # Bright Cyan
export COLOR_16="#073642"           # Bright White

export BACKGROUND_COLOR="#FDF6E3"   # Background
export FOREGROUND_COLOR="#657B83"   # Foreground (Text)

export CURSOR_COLOR="#657B83" # Cursor

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
