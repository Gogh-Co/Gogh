#!/usr/bin/env bash

export PROFILE_NAME="Kissa Latte"

export COLOR_01="#F5F4F0"           # Black (Host)
export COLOR_02="#9E3E3E"           # Red (Syntax string)
export COLOR_03="#387050"           # Green (Command)
export COLOR_04="#7D6820"           # Yellow (Command second)
export COLOR_05="#3468A8"           # Blue (Path)
export COLOR_06="#6438A0"           # Magenta (Syntax var)
export COLOR_07="#287070"           # Cyan (Prompt)
export COLOR_08="#1F1C16"           # White

export COLOR_09="#91887D"           # Bright Black
export COLOR_10="#9E3E3E"           # Bright Red (Command error)
export COLOR_11="#387050"           # Bright Green (Exec)
export COLOR_12="#7D6820"           # Bright Yellow
export COLOR_13="#3468A8"           # Bright Blue (Folder)
export COLOR_14="#6438A0"           # Bright Magenta
export COLOR_15="#287070"           # Bright Cyan
export COLOR_16="#FEFCFA"           # Bright White

export BACKGROUND_COLOR="#F5F4F0"   # Background
export FOREGROUND_COLOR="#1F1C16"   # Foreground (Text)

export CURSOR_COLOR="#1F1C16" # Cursor

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
