#!/usr/bin/env bash

export PROFILE_NAME="Tokyo City Dark"

export COLOR_01="#171D23"           # Black (Host)
export COLOR_02="#F7768E"           # Red (Syntax string)
export COLOR_03="#9ECE6A"           # Green (Command)
export COLOR_04="#B7C5D3"           # Yellow (Command second)
export COLOR_05="#7AA2F7"           # Blue (Path)
export COLOR_06="#BB9AF7"           # Magenta (Syntax var)
export COLOR_07="#89DDFF"           # Cyan (Prompt)
export COLOR_08="#D8E2EC"           # White

export COLOR_09="#526270"           # Bright Black
export COLOR_10="#F7768E"           # Bright Red (Command error)
export COLOR_11="#9ECE6A"           # Bright Green (Exec)
export COLOR_12="#B7C5D3"           # Bright Yellow
export COLOR_13="#7AA2F7"           # Bright Blue (Folder)
export COLOR_14="#BB9AF7"           # Bright Magenta
export COLOR_15="#89DDFF"           # Bright Cyan
export COLOR_16="#FBFBFD"           # Bright White

export BACKGROUND_COLOR="#171D23"   # Background
export FOREGROUND_COLOR="#D8E2EC"   # Foreground (Text)

export CURSOR_COLOR="#D8E2EC" # Cursor

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
