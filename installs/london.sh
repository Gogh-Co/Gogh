#!/usr/bin/env bash

export PROFILE_NAME="London"

export COLOR_01="#FFFFFF"           # Black (Host)
export COLOR_02="#333333"           # Red (Syntax string)
export COLOR_03="#444444"           # Green (Command)
export COLOR_04="#555555"           # Yellow (Command second)
export COLOR_05="#666666"           # Blue (Path)
export COLOR_06="#777777"           # Magenta (Syntax var)
export COLOR_07="#888888"           # Cyan (Prompt)
export COLOR_08="#333333"           # White

export COLOR_09="#333333"           # Bright Black
export COLOR_10="#444444"           # Bright Red (Command error)
export COLOR_11="#555555"           # Bright Green (Exec)
export COLOR_12="#666666"           # Bright Yellow
export COLOR_13="#777777"           # Bright Blue (Folder)
export COLOR_14="#888888"           # Bright Magenta
export COLOR_15="#999999"           # Bright Cyan
export COLOR_16="#AAAAAA"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#333333"   # Foreground (Text)

export CURSOR_COLOR="#333333" # Cursor

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
