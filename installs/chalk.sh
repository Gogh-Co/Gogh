#!/usr/bin/env bash

export PROFILE_NAME="Chalk"

export COLOR_01="#7D8B8F"           # Black (Host)
export COLOR_02="#B23A52"           # Red (Syntax string)
export COLOR_03="#789B6A"           # Green (Command)
export COLOR_04="#B9AC4A"           # Yellow (Command second)
export COLOR_05="#2A7FAC"           # Blue (Path)
export COLOR_06="#BD4F5A"           # Magenta (Syntax var)
export COLOR_07="#44A799"           # Cyan (Prompt)
export COLOR_08="#D2D8D9"           # White

export COLOR_09="#888888"           # Bright Black
export COLOR_10="#F24840"           # Bright Red (Command error)
export COLOR_11="#80C470"           # Bright Green (Exec)
export COLOR_12="#FFEB62"           # Bright Yellow
export COLOR_13="#4196FF"           # Bright Blue (Folder)
export COLOR_14="#FC5275"           # Bright Magenta
export COLOR_15="#53CDBD"           # Bright Cyan
export COLOR_16="#D2D8D9"           # Bright White

export BACKGROUND_COLOR="#2B2D2E"   # Background
export FOREGROUND_COLOR="#D2D8D9"   # Foreground (Text)

export CURSOR_COLOR="#708284" # Cursor

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
