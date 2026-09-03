#!/usr/bin/env bash

export PROFILE_NAME="Velvet Court"

export COLOR_01="#2F1629"           # Black (Host)
export COLOR_02="#EE5C82"           # Red (Syntax string)
export COLOR_03="#9AD08A"           # Green (Command)
export COLOR_04="#F0C44E"           # Yellow (Command second)
export COLOR_05="#B392E8"           # Blue (Path)
export COLOR_06="#D087E0"           # Magenta (Syntax var)
export COLOR_07="#6FD0C8"           # Cyan (Prompt)
export COLOR_08="#E2C8D8"           # White

export COLOR_09="#836075"           # Bright Black
export COLOR_10="#EE5C82"           # Bright Red (Command error)
export COLOR_11="#9AD08A"           # Bright Green (Exec)
export COLOR_12="#E8964F"           # Bright Yellow
export COLOR_13="#B392E8"           # Bright Blue (Folder)
export COLOR_14="#D087E0"           # Bright Magenta
export COLOR_15="#6FD0C8"           # Bright Cyan
export COLOR_16="#F2DCEA"           # Bright White

export BACKGROUND_COLOR="#1F0E1C"   # Background
export FOREGROUND_COLOR="#F2DCEA"   # Foreground (Text)

export CURSOR_COLOR="#F0C44E" # Cursor

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
