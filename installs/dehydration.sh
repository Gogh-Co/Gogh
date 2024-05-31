#!/usr/bin/env bash

export PROFILE_NAME="Dehydration"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#5FD38D"           # Green (Command)
export COLOR_04="#FF9955"           # Yellow (Command second)
export COLOR_05="#3771C8"           # Blue (Path)
export COLOR_06="#BC5FD3"           # Magenta (Syntax var)
export COLOR_07="#5FD3BC"           # Cyan (Prompt)
export COLOR_08="#999999"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#FF8080"           # Bright Red (Command error)
export COLOR_11="#87DEAA"           # Bright Green (Exec)
export COLOR_12="#FFB380"           # Bright Yellow
export COLOR_13="#5F8DD3"           # Bright Blue (Folder)
export COLOR_14="#CD87DE"           # Bright Magenta
export COLOR_15="#87DECD"           # Bright Cyan
export COLOR_16="#CCCCCC"           # Bright White

export BACKGROUND_COLOR="#333333"   # Background
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
