#!/usr/bin/env bash

export PROFILE_NAME="Berlin"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#999999"           # Red (Syntax string)
export COLOR_03="#BBBBBB"           # Green (Command)
export COLOR_04="#DDDDDD"           # Yellow (Command second)
export COLOR_05="#888888"           # Blue (Path)
export COLOR_06="#AAAAAA"           # Magenta (Syntax var)
export COLOR_07="#CCCCCC"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#333333"           # Bright Black
export COLOR_10="#BBBBBB"           # Bright Red (Command error)
export COLOR_11="#DDDDDD"           # Bright Green (Exec)
export COLOR_12="#FFFFFF"           # Bright Yellow
export COLOR_13="#AAAAAA"           # Bright Blue (Folder)
export COLOR_14="#CCCCCC"           # Bright Magenta
export COLOR_15="#EEEEEE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
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
