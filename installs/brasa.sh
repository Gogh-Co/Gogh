#!/usr/bin/env bash

export PROFILE_NAME="Brasa"

export COLOR_01="#1A0F0A"           # Black (Host)
export COLOR_02="#F2685A"           # Red (Syntax string)
export COLOR_03="#B8C24A"           # Green (Command)
export COLOR_04="#F0B23A"           # Yellow (Command second)
export COLOR_05="#9AA6E0"           # Blue (Path)
export COLOR_06="#E68AA2"           # Magenta (Syntax var)
export COLOR_07="#6BC8B8"           # Cyan (Prompt)
export COLOR_08="#F0D8C0"           # White

export COLOR_09="#7A6150"           # Bright Black
export COLOR_10="#F2685A"           # Bright Red (Command error)
export COLOR_11="#B8C24A"           # Bright Green (Exec)
export COLOR_12="#F0B23A"           # Bright Yellow
export COLOR_13="#9AA6E0"           # Bright Blue (Folder)
export COLOR_14="#E68AA2"           # Bright Magenta
export COLOR_15="#6BC8B8"           # Bright Cyan
export COLOR_16="#FBEAD8"           # Bright White

export BACKGROUND_COLOR="#1A0F0A"   # Background
export FOREGROUND_COLOR="#F0D8C0"   # Foreground (Text)

export CURSOR_COLOR="#F0D8C0" # Cursor

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
