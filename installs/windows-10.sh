#!/usr/bin/env bash

export PROFILE_NAME="Windows 10"

export COLOR_01="#0C0C0C"           # Black (Host)
export COLOR_02="#E74856"           # Red (Syntax string)
export COLOR_03="#16C60C"           # Green (Command)
export COLOR_04="#F9F1A5"           # Yellow (Command second)
export COLOR_05="#3B78FF"           # Blue (Path)
export COLOR_06="#B4009E"           # Magenta (Syntax var)
export COLOR_07="#61D6D6"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#767676"           # Bright Black
export COLOR_10="#E74856"           # Bright Red (Command error)
export COLOR_11="#16C60C"           # Bright Green (Exec)
export COLOR_12="#F9F1A5"           # Bright Yellow
export COLOR_13="#3B78FF"           # Bright Blue (Folder)
export COLOR_14="#B4009E"           # Bright Magenta
export COLOR_15="#61D6D6"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#0C0C0C"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
