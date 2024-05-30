#!/usr/bin/env bash

export PROFILE_NAME="Molokai"

export COLOR_01="#1B1D1E"           # Black (Host)
export COLOR_02="#7325FA"           # Red (Syntax string)
export COLOR_03="#23E298"           # Green (Command)
export COLOR_04="#60D4DF"           # Yellow (Command second)
export COLOR_05="#D08010"           # Blue (Path)
export COLOR_06="#FF0087"           # Magenta (Syntax var)
export COLOR_07="#D0A843"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#9D66F6"           # Bright Red (Command error)
export COLOR_11="#5FE0B1"           # Bright Green (Exec)
export COLOR_12="#6DF2FF"           # Bright Yellow
export COLOR_13="#FFAF00"           # Bright Blue (Folder)
export COLOR_14="#FF87AF"           # Bright Magenta
export COLOR_15="#FFCE51"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1B1D1E"   # Background
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
