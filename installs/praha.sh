#!/usr/bin/env bash

export PROFILE_NAME="Praha"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#B8E6A0"           # Green (Command)
export COLOR_04="#FFE4A3"           # Yellow (Command second)
export COLOR_05="#BD93F9"           # Blue (Path)
export COLOR_06="#FF9AA2"           # Magenta (Syntax var)
export COLOR_07="#8BE9FD"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#6272A4"           # Bright Black
export COLOR_10="#FF6E6E"           # Bright Red (Command error)
export COLOR_11="#B8E6A0"           # Bright Green (Exec)
export COLOR_12="#FFE4A3"           # Bright Yellow
export COLOR_13="#D6ACFF"           # Bright Blue (Folder)
export COLOR_14="#FF9AA2"           # Bright Magenta
export COLOR_15="#A4FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

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
