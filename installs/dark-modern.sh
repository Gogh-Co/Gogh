#!/usr/bin/env bash

export PROFILE_NAME="Dark Modern"

export COLOR_01="#272727"           # Black (Host)
export COLOR_02="#F74949"           # Red (Syntax string)
export COLOR_03="#2EA043"           # Green (Command)
export COLOR_04="#9E6A03"           # Yellow (Command second)
export COLOR_05="#0078D4"           # Blue (Path)
export COLOR_06="#D01273"           # Magenta (Syntax var)
export COLOR_07="#1DB4D6"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#5D5D5D"           # Bright Black
export COLOR_10="#DC5452"           # Bright Red (Command error)
export COLOR_11="#23D18B"           # Bright Green (Exec)
export COLOR_12="#F5F543"           # Bright Yellow
export COLOR_13="#3B8EEA"           # Bright Blue (Folder)
export COLOR_14="#D670D6"           # Bright Magenta
export COLOR_15="#29B8DB"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#1F1F1F"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
