#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Mall"

export COLOR_01="#1E1E1F"           # Black (Host)
export COLOR_02="#A17EFC"           # Red (Syntax string)
export COLOR_03="#75BFFF"           # Green (Command)
export COLOR_04="#B3DBFF"           # Yellow (Command second)
export COLOR_05="#B294FF"           # Blue (Path)
export COLOR_06="#75BFFF"           # Magenta (Syntax var)
export COLOR_07="#C5ADFF"           # Cyan (Prompt)
export COLOR_08="#97959D"           # White

export COLOR_09="#5E5C60"           # Bright Black
export COLOR_10="#8AC8FF"           # Bright Red (Command error)
export COLOR_11="#2B2B2C"           # Bright Green (Exec)
export COLOR_12="#515053"           # Bright Yellow
export COLOR_13="#6A686E"           # Bright Blue (Folder)
export COLOR_14="#E5DBFF"           # Bright Magenta
export COLOR_15="#69B5F7"           # Bright Cyan
export COLOR_16="#F4F0FF"           # Bright White

export BACKGROUND_COLOR="#1E1E1F"   # Background
export FOREGROUND_COLOR="#97959D"   # Foreground (Text)

export CURSOR_COLOR="#3692E2" # Cursor

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
