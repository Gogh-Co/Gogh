#!/usr/bin/env bash

export PROFILE_NAME="Acid Lime"

export COLOR_01="#131D0C"           # Black (Host)
export COLOR_02="#FF3344"           # Red (Syntax string)
export COLOR_03="#97E63C"           # Green (Command)
export COLOR_04="#EEFF5C"           # Yellow (Command second)
export COLOR_05="#4DECA0"           # Blue (Path)
export COLOR_06="#A6FF6B"           # Magenta (Syntax var)
export COLOR_07="#50FFB4"           # Cyan (Prompt)
export COLOR_08="#BFE0A4"           # White

export COLOR_09="#4A6B36"           # Bright Black
export COLOR_10="#FF3344"           # Bright Red (Command error)
export COLOR_11="#97E63C"           # Bright Green (Exec)
export COLOR_12="#DBFF45"           # Bright Yellow
export COLOR_13="#4DECA0"           # Bright Blue (Folder)
export COLOR_14="#A6FF6B"           # Bright Magenta
export COLOR_15="#50FFB4"           # Bright Cyan
export COLOR_16="#D4EFBC"           # Bright White

export BACKGROUND_COLOR="#080C05"   # Background
export FOREGROUND_COLOR="#D4EFBC"   # Foreground (Text)

export CURSOR_COLOR="#C2FF33" # Cursor

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
