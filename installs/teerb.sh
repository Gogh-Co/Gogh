#!/usr/bin/env bash

export PROFILE_NAME="Teerb"

export COLOR_01="#1C1C1C"           # Black (Host)
export COLOR_02="#D68686"           # Red (Syntax string)
export COLOR_03="#AED686"           # Green (Command)
export COLOR_04="#D7AF87"           # Yellow (Command second)
export COLOR_05="#86AED6"           # Blue (Path)
export COLOR_06="#D6AED6"           # Magenta (Syntax var)
export COLOR_07="#8ADBB4"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#1C1C1C"           # Bright Black
export COLOR_10="#D68686"           # Bright Red (Command error)
export COLOR_11="#AED686"           # Bright Green (Exec)
export COLOR_12="#E4C9AF"           # Bright Yellow
export COLOR_13="#86AED6"           # Bright Blue (Folder)
export COLOR_14="#D6AED6"           # Bright Magenta
export COLOR_15="#B1E7DD"           # Bright Cyan
export COLOR_16="#EFEFEF"           # Bright White

export BACKGROUND_COLOR="#262626"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
