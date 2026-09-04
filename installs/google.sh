#!/usr/bin/env bash

export PROFILE_NAME="Google"

export COLOR_01="#1D1F21"           # Black (Host)
export COLOR_02="#CC342B"           # Red (Syntax string)
export COLOR_03="#198844"           # Green (Command)
export COLOR_04="#FBA922"           # Yellow (Command second)
export COLOR_05="#3971ED"           # Blue (Path)
export COLOR_06="#A36AC7"           # Magenta (Syntax var)
export COLOR_07="#3971ED"           # Cyan (Prompt)
export COLOR_08="#C5C8C6"           # White

export COLOR_09="#969896"           # Bright Black
export COLOR_10="#CC342B"           # Bright Red (Command error)
export COLOR_11="#198844"           # Bright Green (Exec)
export COLOR_12="#FBA922"           # Bright Yellow
export COLOR_13="#3971ED"           # Bright Blue (Folder)
export COLOR_14="#A36AC7"           # Bright Magenta
export COLOR_15="#3971ED"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1D1F21"   # Background
export FOREGROUND_COLOR="#C5C8C6"   # Foreground (Text)

export CURSOR_COLOR="#C5C8C6" # Cursor

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
