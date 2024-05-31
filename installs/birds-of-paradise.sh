#!/usr/bin/env bash

export PROFILE_NAME="Birds Of Paradise"

export COLOR_01="#573D26"           # Black (Host)
export COLOR_02="#BE2D26"           # Red (Syntax string)
export COLOR_03="#6BA18A"           # Green (Command)
export COLOR_04="#E99D2A"           # Yellow (Command second)
export COLOR_05="#5A86AD"           # Blue (Path)
export COLOR_06="#AC80A6"           # Magenta (Syntax var)
export COLOR_07="#74A6AD"           # Cyan (Prompt)
export COLOR_08="#E0DBB7"           # White

export COLOR_09="#9B6C4A"           # Bright Black
export COLOR_10="#E84627"           # Bright Red (Command error)
export COLOR_11="#95D8BA"           # Bright Green (Exec)
export COLOR_12="#D0D150"           # Bright Yellow
export COLOR_13="#B8D3ED"           # Bright Blue (Folder)
export COLOR_14="#D19ECB"           # Bright Magenta
export COLOR_15="#93CFD7"           # Bright Cyan
export COLOR_16="#FFF9D5"           # Bright White

export BACKGROUND_COLOR="#2A1F1D"   # Background
export FOREGROUND_COLOR="#E0DBB7"   # Foreground (Text)

export CURSOR_COLOR="#E0DBB7" # Cursor

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
