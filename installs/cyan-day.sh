#!/usr/bin/env bash

export PROFILE_NAME="Cyan Day"

export COLOR_01="#12343B"           # Black (Host)
export COLOR_02="#B3345C"           # Red (Syntax string)
export COLOR_03="#147C72"           # Green (Command)
export COLOR_04="#9B6A00"           # Yellow (Command second)
export COLOR_05="#006D8F"           # Blue (Path)
export COLOR_06="#6F4AA8"           # Magenta (Syntax var)
export COLOR_07="#008CA8"           # Cyan (Prompt)
export COLOR_08="#E8FBFF"           # White

export COLOR_09="#5B7E86"           # Bright Black
export COLOR_10="#D64B73"           # Bright Red (Command error)
export COLOR_11="#1B9A8E"           # Bright Green (Exec)
export COLOR_12="#C98300"           # Bright Yellow
export COLOR_13="#0088B8"           # Bright Blue (Folder)
export COLOR_14="#8964C8"           # Bright Magenta
export COLOR_15="#00AFCF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#E8FBFF"   # Background
export FOREGROUND_COLOR="#12343B"   # Foreground (Text)

export CURSOR_COLOR="#008CA8" # Cursor

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
