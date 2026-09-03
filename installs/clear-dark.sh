#!/usr/bin/env bash

export PROFILE_NAME="Clear Dark"

export COLOR_01="#35424C"           # Black (Host)
export COLOR_02="#B45648"           # Red (Syntax string)
export COLOR_03="#6CAA71"           # Green (Command)
export COLOR_04="#C4AC62"           # Yellow (Command second)
export COLOR_05="#6D96B4"           # Blue (Path)
export COLOR_06="#BD7BCD"           # Magenta (Syntax var)
export COLOR_07="#7CCBCD"           # Cyan (Prompt)
export COLOR_08="#DEE5EB"           # White

export COLOR_09="#465C6D"           # Bright Black
export COLOR_10="#DF6C5A"           # Bright Red (Command error)
export COLOR_11="#79BE7E"           # Bright Green (Exec)
export COLOR_12="#E5C872"           # Bright Yellow
export COLOR_13="#67B5ED"           # Bright Blue (Folder)
export COLOR_14="#D389E5"           # Bright Magenta
export COLOR_15="#84DDE0"           # Bright Cyan
export COLOR_16="#E5EFF5"           # Bright White

export BACKGROUND_COLOR="#212734"   # Background
export FOREGROUND_COLOR="#E6E6E6"   # Foreground (Text)

export CURSOR_COLOR="#9D9D9D" # Cursor

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
