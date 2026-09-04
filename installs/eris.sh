#!/usr/bin/env bash

export PROFILE_NAME="Eris"

export COLOR_01="#0A0920"           # Black (Host)
export COLOR_02="#F768A3"           # Red (Syntax string)
export COLOR_03="#A2FAA8"           # Green (Command)
export COLOR_04="#F7D668"           # Yellow (Command second)
export COLOR_05="#258FC4"           # Blue (Path)
export COLOR_06="#C368F7"           # Magenta (Syntax var)
export COLOR_07="#A2FAF0"           # Cyan (Prompt)
export COLOR_08="#606BAC"           # White

export COLOR_09="#333773"           # Bright Black
export COLOR_10="#F768A3"           # Bright Red (Command error)
export COLOR_11="#A2FAA8"           # Bright Green (Exec)
export COLOR_12="#F7D668"           # Bright Yellow
export COLOR_13="#258FC4"           # Bright Blue (Folder)
export COLOR_14="#C368F7"           # Bright Magenta
export COLOR_15="#A2FAF0"           # Bright Cyan
export COLOR_16="#9AAAE5"           # Bright White

export BACKGROUND_COLOR="#0A0920"   # Background
export FOREGROUND_COLOR="#606BAC"   # Foreground (Text)

export CURSOR_COLOR="#606BAC" # Cursor

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
