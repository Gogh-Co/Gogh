#!/usr/bin/env bash

export PROFILE_NAME="Molokai"

export COLOR_01="#121212"           # Black (Host)
export COLOR_02="#FA2573"           # Red (Syntax string)
export COLOR_03="#98E123"           # Green (Command)
export COLOR_04="#DFD460"           # Yellow (Command second)
export COLOR_05="#1080D0"           # Blue (Path)
export COLOR_06="#8700FF"           # Magenta (Syntax var)
export COLOR_07="#43A8D0"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#F6669D"           # Bright Red (Command error)
export COLOR_11="#B1E05F"           # Bright Green (Exec)
export COLOR_12="#FFF26D"           # Bright Yellow
export COLOR_13="#00AFFF"           # Bright Blue (Folder)
export COLOR_14="#AF87FF"           # Bright Magenta
export COLOR_15="#51CEFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#BBBBBB"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
