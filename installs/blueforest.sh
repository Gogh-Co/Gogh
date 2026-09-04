#!/usr/bin/env bash

export PROFILE_NAME="Blueforest"

export COLOR_01="#141F2E"           # Black (Host)
export COLOR_02="#FFFAB1"           # Red (Syntax string)
export COLOR_03="#80FF80"           # Green (Command)
export COLOR_04="#91CCFF"           # Yellow (Command second)
export COLOR_05="#A2CFF5"           # Blue (Path)
export COLOR_06="#0099FF"           # Magenta (Syntax var)
export COLOR_07="#80FF80"           # Cyan (Prompt)
export COLOR_08="#FFCC33"           # White

export COLOR_09="#A0FFA0"           # Bright Black
export COLOR_10="#FFFAB1"           # Bright Red (Command error)
export COLOR_11="#80FF80"           # Bright Green (Exec)
export COLOR_12="#91CCFF"           # Bright Yellow
export COLOR_13="#A2CFF5"           # Bright Blue (Folder)
export COLOR_14="#0099FF"           # Bright Magenta
export COLOR_15="#80FF80"           # Bright Cyan
export COLOR_16="#375780"           # Bright White

export BACKGROUND_COLOR="#141F2E"   # Background
export FOREGROUND_COLOR="#FFCC33"   # Foreground (Text)

export CURSOR_COLOR="#FFCC33" # Cursor

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
