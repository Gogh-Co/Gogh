#!/usr/bin/env bash

export PROFILE_NAME="Summer Pop"

export COLOR_01="#666666"           # Black (Host)
export COLOR_02="#FF1E8E"           # Red (Syntax string)
export COLOR_03="#8EFF1E"           # Green (Command)
export COLOR_04="#FFFB00"           # Yellow (Command second)
export COLOR_05="#1E8EFF"           # Blue (Path)
export COLOR_06="#E500E5"           # Magenta (Syntax var)
export COLOR_07="#00E5E5"           # Cyan (Prompt)
export COLOR_08="#E5E5E5"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF1E8E"           # Bright Red (Command error)
export COLOR_11="#8EFF1E"           # Bright Green (Exec)
export COLOR_12="#FFFB00"           # Bright Yellow
export COLOR_13="#1E8EFF"           # Bright Blue (Folder)
export COLOR_14="#E500E5"           # Bright Magenta
export COLOR_15="#00E5E5"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#272822"   # Background
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
