#!/usr/bin/env bash

export PROFILE_NAME="Elegant"

export COLOR_01="#0C1221"           # Black (Host)
export COLOR_02="#EA335B"           # Red (Syntax string)
export COLOR_03="#95CA9A"           # Green (Command)
export COLOR_04="#F7CD94"           # Yellow (Command second)
export COLOR_05="#93AADD"           # Blue (Path)
export COLOR_06="#BF94E5"           # Magenta (Syntax var)
export COLOR_07="#8CCAEC"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#EA335B"           # Bright Red (Command error)
export COLOR_11="#95CA9A"           # Bright Green (Exec)
export COLOR_12="#F7CD94"           # Bright Yellow
export COLOR_13="#93AADD"           # Bright Blue (Folder)
export COLOR_14="#BF94E5"           # Bright Magenta
export COLOR_15="#5FAAE9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#292B31"   # Background
export FOREGROUND_COLOR="#CFD2D6"   # Foreground (Text)

export CURSOR_COLOR="#55BBF9" # Cursor

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
