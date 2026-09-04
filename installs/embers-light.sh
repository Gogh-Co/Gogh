#!/usr/bin/env bash

export PROFILE_NAME="Embers Light"

export COLOR_01="#DBD6D1"           # Black (Host)
export COLOR_02="#826D57"           # Red (Syntax string)
export COLOR_03="#57826D"           # Green (Command)
export COLOR_04="#6D8257"           # Yellow (Command second)
export COLOR_05="#6D5782"           # Blue (Path)
export COLOR_06="#82576D"           # Magenta (Syntax var)
export COLOR_07="#576D82"           # Cyan (Prompt)
export COLOR_08="#433B32"           # White

export COLOR_09="#8A8075"           # Bright Black
export COLOR_10="#826D57"           # Bright Red (Command error)
export COLOR_11="#57826D"           # Bright Green (Exec)
export COLOR_12="#6D8257"           # Bright Yellow
export COLOR_13="#6D5782"           # Bright Blue (Folder)
export COLOR_14="#82576D"           # Bright Magenta
export COLOR_15="#576D82"           # Bright Cyan
export COLOR_16="#16130F"           # Bright White

export BACKGROUND_COLOR="#DBD6D1"   # Background
export FOREGROUND_COLOR="#433B32"   # Foreground (Text)

export CURSOR_COLOR="#433B32" # Cursor

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
