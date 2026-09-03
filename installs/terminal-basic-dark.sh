#!/usr/bin/env bash

export PROFILE_NAME="Terminal Basic Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C65339"           # Red (Syntax string)
export COLOR_03="#6AC44B"           # Green (Command)
export COLOR_04="#B8B74A"           # Yellow (Command second)
export COLOR_05="#6444ED"           # Blue (Path)
export COLOR_06="#D357DB"           # Magenta (Syntax var)
export COLOR_07="#69C1CF"           # Cyan (Prompt)
export COLOR_08="#D1D1D1"           # White

export COLOR_09="#909090"           # Bright Black
export COLOR_10="#EB5A3A"           # Bright Red (Command error)
export COLOR_11="#77EA51"           # Bright Green (Exec)
export COLOR_12="#EFEF53"           # Bright Yellow
export COLOR_13="#D09AF9"           # Bright Blue (Folder)
export COLOR_14="#EB5AF7"           # Bright Magenta
export COLOR_15="#78F1F2"           # Bright Cyan
export COLOR_16="#EDEDED"           # Bright White

export BACKGROUND_COLOR="#1D1E1D"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#9D9D9D" # Cursor

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
