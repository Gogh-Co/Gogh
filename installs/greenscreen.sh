#!/usr/bin/env bash

export PROFILE_NAME="Greenscreen"

export COLOR_01="#001100"           # Black (Host)
export COLOR_02="#007700"           # Red (Syntax string)
export COLOR_03="#00BB00"           # Green (Command)
export COLOR_04="#007700"           # Yellow (Command second)
export COLOR_05="#009900"           # Blue (Path)
export COLOR_06="#00BB00"           # Magenta (Syntax var)
export COLOR_07="#005500"           # Cyan (Prompt)
export COLOR_08="#00BB00"           # White

export COLOR_09="#007700"           # Bright Black
export COLOR_10="#007700"           # Bright Red (Command error)
export COLOR_11="#00BB00"           # Bright Green (Exec)
export COLOR_12="#007700"           # Bright Yellow
export COLOR_13="#009900"           # Bright Blue (Folder)
export COLOR_14="#00BB00"           # Bright Magenta
export COLOR_15="#005500"           # Bright Cyan
export COLOR_16="#00FF00"           # Bright White

export BACKGROUND_COLOR="#001100"   # Background
export FOREGROUND_COLOR="#00BB00"   # Foreground (Text)

export CURSOR_COLOR="#00BB00" # Cursor

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
