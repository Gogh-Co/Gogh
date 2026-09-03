#!/usr/bin/env bash

export PROFILE_NAME="iTerm2 Tango Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D81E00"           # Red (Syntax string)
export COLOR_03="#5EA702"           # Green (Command)
export COLOR_04="#CFAE00"           # Yellow (Command second)
export COLOR_05="#427AB3"           # Blue (Path)
export COLOR_06="#89658E"           # Magenta (Syntax var)
export COLOR_07="#00A7AA"           # Cyan (Prompt)
export COLOR_08="#DBDED8"           # White

export COLOR_09="#686A66"           # Bright Black
export COLOR_10="#F54235"           # Bright Red (Command error)
export COLOR_11="#99E343"           # Bright Green (Exec)
export COLOR_12="#FDEB61"           # Bright Yellow
export COLOR_13="#84B0D8"           # Bright Blue (Folder)
export COLOR_14="#BC94B7"           # Bright Magenta
export COLOR_15="#37E6E8"           # Bright Cyan
export COLOR_16="#F1F1F0"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
