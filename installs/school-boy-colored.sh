#!/usr/bin/env bash

export PROFILE_NAME="School Boy Colored"

export COLOR_01="#174715"           # Black (Host)
export COLOR_02="#FCA4A4"           # Red (Syntax string)
export COLOR_03="#9BFC94"           # Green (Command)
export COLOR_04="#FCF45F"           # Yellow (Command second)
export COLOR_05="#6384F9"           # Blue (Path)
export COLOR_06="#F771FC"           # Magenta (Syntax var)
export COLOR_07="#7EE9FC"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#21631E"           # Bright Black
export COLOR_10="#FCC2C2"           # Bright Red (Command error)
export COLOR_11="#BCFCB8"           # Bright Green (Exec)
export COLOR_12="#FCF797"           # Bright Yellow
export COLOR_13="#8AA3FC"           # Bright Blue (Folder)
export COLOR_14="#F99FFC"           # Bright Magenta
export COLOR_15="#A9EFFC"           # Bright Cyan
export COLOR_16="#DDDDDD"           # Bright White

export BACKGROUND_COLOR="#0B230A"   # Background
export FOREGROUND_COLOR="#BFBFBF"   # Foreground (Text)

export CURSOR_COLOR="#BFBFBF" # Cursor

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
