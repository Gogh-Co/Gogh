#!/usr/bin/env bash

export PROFILE_NAME="Fallout Pip Boy"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#3B3A23"           # Red (Syntax string)
export COLOR_03="#09A600"           # Green (Command)
export COLOR_04="#8F7500"           # Yellow (Command second)
export COLOR_05="#2C83FF"           # Blue (Path)
export COLOR_06="#701D43"           # Magenta (Syntax var)
export COLOR_07="#009151"           # Cyan (Prompt)
export COLOR_08="#59FF59"           # White

export COLOR_09="#003300"           # Bright Black
export COLOR_10="#5BFF00"           # Bright Red (Command error)
export COLOR_11="#32CD32"           # Bright Green (Exec)
export COLOR_12="#8F7C48"           # Bright Yellow
export COLOR_13="#1D55A6"           # Bright Blue (Folder)
export COLOR_14="#20755E"           # Bright Magenta
export COLOR_15="#4DFFB8"           # Bright Cyan
export COLOR_16="#99FF99"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#4D9154"   # Foreground (Text)

export CURSOR_COLOR="#4D9154" # Cursor

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
