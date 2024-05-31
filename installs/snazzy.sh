#!/usr/bin/env bash

export PROFILE_NAME="Snazzy"

export COLOR_01="#282A36"           # Black (Host)
export COLOR_02="#FF5C57"           # Red (Syntax string)
export COLOR_03="#5AF78E"           # Green (Command)
export COLOR_04="#F3F99D"           # Yellow (Command second)
export COLOR_05="#57C7FF"           # Blue (Path)
export COLOR_06="#FF6AC1"           # Magenta (Syntax var)
export COLOR_07="#9AEDFE"           # Cyan (Prompt)
export COLOR_08="#F1F1F0"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#FF5C57"           # Bright Red (Command error)
export COLOR_11="#5AF78E"           # Bright Green (Exec)
export COLOR_12="#F3F99D"           # Bright Yellow
export COLOR_13="#57C7FF"           # Bright Blue (Folder)
export COLOR_14="#FF6AC1"           # Bright Magenta
export COLOR_15="#9AEDFE"           # Bright Cyan
export COLOR_16="#EFF0EB"           # Bright White

export BACKGROUND_COLOR="#282A36"   # Background
export FOREGROUND_COLOR="#EFF0EB"   # Foreground (Text)

export CURSOR_COLOR="#97979B" # Cursor

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
