#!/usr/bin/env bash

export PROFILE_NAME="Minimalist Dark"

export COLOR_01="#F5F5F5"           # Black (Host)
export COLOR_02="#B81414"           # Red (Syntax string)
export COLOR_03="#1B9F6B"           # Green (Command)
export COLOR_04="#D28F79"           # Yellow (Command second)
export COLOR_05="#AA5A24"           # Blue (Path)
export COLOR_06="#9E40A3"           # Magenta (Syntax var)
export COLOR_07="#FE8330"           # Cyan (Prompt)
export COLOR_08="#A5A2A2"           # White

export COLOR_09="#5C5855"           # Bright Black
export COLOR_10="#E8BBD0"           # Bright Red (Command error)
export COLOR_11="#006400"           # Bright Green (Exec)
export COLOR_12="#4A4543"           # Bright Yellow
export COLOR_13="#A16A94"           # Bright Blue (Folder)
export COLOR_14="#A020F0"           # Bright Magenta
export COLOR_15="#FF69B4"           # Bright Cyan
export COLOR_16="#CACAD0"           # Bright White

export BACKGROUND_COLOR="#13141f"   # Background
export FOREGROUND_COLOR="#F5F5F5"   # Foreground (Text)

export CURSOR_COLOR="#F5F5F5" # Cursor

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
