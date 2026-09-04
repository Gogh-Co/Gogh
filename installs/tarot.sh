#!/usr/bin/env bash

export PROFILE_NAME="Tarot"

export COLOR_01="#0E091D"           # Black (Host)
export COLOR_02="#C53253"           # Red (Syntax string)
export COLOR_03="#A68E5A"           # Green (Command)
export COLOR_04="#FF6565"           # Yellow (Command second)
export COLOR_05="#6E6080"           # Blue (Path)
export COLOR_06="#A45782"           # Magenta (Syntax var)
export COLOR_07="#8C9785"           # Cyan (Prompt)
export COLOR_08="#AA556F"           # White

export COLOR_09="#74316B"           # Bright Black
export COLOR_10="#C53253"           # Bright Red (Command error)
export COLOR_11="#A68E5A"           # Bright Green (Exec)
export COLOR_12="#FF6565"           # Bright Yellow
export COLOR_13="#6E6080"           # Bright Blue (Folder)
export COLOR_14="#A45782"           # Bright Magenta
export COLOR_15="#8C9785"           # Bright Cyan
export COLOR_16="#DC8F7C"           # Bright White

export BACKGROUND_COLOR="#0E091D"   # Background
export FOREGROUND_COLOR="#AA556F"   # Foreground (Text)

export CURSOR_COLOR="#AA556F" # Cursor

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
