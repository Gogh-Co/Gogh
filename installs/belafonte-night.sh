#!/usr/bin/env bash

export PROFILE_NAME="Belafonte Night"

export COLOR_01="#20111B"           # Black (Host)
export COLOR_02="#BE100E"           # Red (Syntax string)
export COLOR_03="#858162"           # Green (Command)
export COLOR_04="#EAA549"           # Yellow (Command second)
export COLOR_05="#426A79"           # Blue (Path)
export COLOR_06="#97522C"           # Magenta (Syntax var)
export COLOR_07="#989A9C"           # Cyan (Prompt)
export COLOR_08="#968C83"           # White

export COLOR_09="#5E5252"           # Bright Black
export COLOR_10="#BE100E"           # Bright Red (Command error)
export COLOR_11="#858162"           # Bright Green (Exec)
export COLOR_12="#EAA549"           # Bright Yellow
export COLOR_13="#426A79"           # Bright Blue (Folder)
export COLOR_14="#97522C"           # Bright Magenta
export COLOR_15="#989A9C"           # Bright Cyan
export COLOR_16="#D5CCBA"           # Bright White

export BACKGROUND_COLOR="#20111B"   # Background
export FOREGROUND_COLOR="#968C83"   # Foreground (Text)

export CURSOR_COLOR="#968C83" # Cursor

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
