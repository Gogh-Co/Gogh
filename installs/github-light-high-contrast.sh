#!/usr/bin/env bash

export PROFILE_NAME="GitHub Light High Contrast"

export COLOR_01="#0E1116"           # Black (Host)
export COLOR_02="#A0111F"           # Red (Syntax string)
export COLOR_03="#024C1A"           # Green (Command)
export COLOR_04="#3F2200"           # Yellow (Command second)
export COLOR_05="#0349B4"           # Blue (Path)
export COLOR_06="#622CBC"           # Magenta (Syntax var)
export COLOR_07="#1B7C83"           # Cyan (Prompt)
export COLOR_08="#66707B"           # White

export COLOR_09="#4B535D"           # Bright Black
export COLOR_10="#86061D"           # Bright Red (Command error)
export COLOR_11="#055D20"           # Bright Green (Exec)
export COLOR_12="#4E2C00"           # Bright Yellow
export COLOR_13="#1168E3"           # Bright Blue (Folder)
export COLOR_14="#844AE7"           # Bright Magenta
export COLOR_15="#3192AA"           # Bright Cyan
export COLOR_16="#88929D"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#0E1116"   # Foreground (Text)

export CURSOR_COLOR="#0349B4" # Cursor

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
