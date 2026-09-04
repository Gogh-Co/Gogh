#!/usr/bin/env bash

export PROFILE_NAME="Spacemacs"

export COLOR_01="#1F2022"           # Black (Host)
export COLOR_02="#F2241F"           # Red (Syntax string)
export COLOR_03="#67B11D"           # Green (Command)
export COLOR_04="#B1951D"           # Yellow (Command second)
export COLOR_05="#4F97D7"           # Blue (Path)
export COLOR_06="#A31DB1"           # Magenta (Syntax var)
export COLOR_07="#2D9574"           # Cyan (Prompt)
export COLOR_08="#A3A3A3"           # White

export COLOR_09="#585858"           # Bright Black
export COLOR_10="#F2241F"           # Bright Red (Command error)
export COLOR_11="#67B11D"           # Bright Green (Exec)
export COLOR_12="#B1951D"           # Bright Yellow
export COLOR_13="#4F97D7"           # Bright Blue (Folder)
export COLOR_14="#A31DB1"           # Bright Magenta
export COLOR_15="#2D9574"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#1F2022"   # Background
export FOREGROUND_COLOR="#A3A3A3"   # Foreground (Text)

export CURSOR_COLOR="#A3A3A3" # Cursor

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
