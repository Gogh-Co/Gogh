#!/usr/bin/env bash

export PROFILE_NAME="branch"

export COLOR_01="#32251D"           # Black (Host)
export COLOR_02="#B55C38"           # Red (Syntax string)
export COLOR_03="#99A667"           # Green (Command)
export COLOR_04="#CA9D64"           # Yellow (Command second)
export COLOR_05="#528C8B"           # Blue (Path)
export COLOR_06="#BA8161"           # Magenta (Syntax var)
export COLOR_07="#6F9990"           # Cyan (Prompt)
export COLOR_08="#CDC1AC"           # White

export COLOR_09="#544A46"           # Bright Black
export COLOR_10="#B55C38"           # Bright Red (Command error)
export COLOR_11="#99A667"           # Bright Green (Exec)
export COLOR_12="#CA9D64"           # Bright Yellow
export COLOR_13="#528C8B"           # Bright Blue (Folder)
export COLOR_14="#BA8161"           # Bright Magenta
export COLOR_15="#6F9990"           # Bright Cyan
export COLOR_16="#CDC1AC"           # Bright White

export BACKGROUND_COLOR="#30231B"   # Background
export FOREGROUND_COLOR="#CDC1AC"   # Foreground (Text)

export CURSOR_COLOR="#CDC1AC" # Cursor

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
