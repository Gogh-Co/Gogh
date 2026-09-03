#!/usr/bin/env bash

export PROFILE_NAME="Black Metal"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#486E6F"           # Red (Syntax string)
export COLOR_03="#DD9999"           # Green (Command)
export COLOR_04="#A06666"           # Yellow (Command second)
export COLOR_05="#888888"           # Blue (Path)
export COLOR_06="#999999"           # Magenta (Syntax var)
export COLOR_07="#AAAAAA"           # Cyan (Prompt)
export COLOR_08="#C1C1C1"           # White

export COLOR_09="#404040"           # Bright Black
export COLOR_10="#486E6F"           # Bright Red (Command error)
export COLOR_11="#DD9999"           # Bright Green (Exec)
export COLOR_12="#A06666"           # Bright Yellow
export COLOR_13="#888888"           # Bright Blue (Folder)
export COLOR_14="#999999"           # Bright Magenta
export COLOR_15="#AAAAAA"           # Bright Cyan
export COLOR_16="#C1C1C1"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#C1C1C1"   # Foreground (Text)

export CURSOR_COLOR="#C1C1C1" # Cursor

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
