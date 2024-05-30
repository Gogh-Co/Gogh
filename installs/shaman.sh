#!/usr/bin/env bash

export PROFILE_NAME="Shaman"

export COLOR_01="#012026"           # Black (Host)
export COLOR_02="#B2302D"           # Red (Syntax string)
export COLOR_03="#00A941"           # Green (Command)
export COLOR_04="#5E8BAA"           # Yellow (Command second)
export COLOR_05="#449A86"           # Blue (Path)
export COLOR_06="#00599D"           # Magenta (Syntax var)
export COLOR_07="#5D7E19"           # Cyan (Prompt)
export COLOR_08="#405555"           # White

export COLOR_09="#384451"           # Bright Black
export COLOR_10="#FF4242"           # Bright Red (Command error)
export COLOR_11="#2AEA5E"           # Bright Green (Exec)
export COLOR_12="#8ED4FD"           # Bright Yellow
export COLOR_13="#61D5BA"           # Bright Blue (Folder)
export COLOR_14="#1298FF"           # Bright Magenta
export COLOR_15="#98D028"           # Bright Cyan
export COLOR_16="#58FBD6"           # Bright White

export BACKGROUND_COLOR="#001015"   # Background
export FOREGROUND_COLOR="#405555"   # Foreground (Text)

export CURSOR_COLOR="#405555" # Cursor

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
