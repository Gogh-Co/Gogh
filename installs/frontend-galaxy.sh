#!/usr/bin/env bash

export PROFILE_NAME="Frontend Galaxy"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F9555F"           # Red (Syntax string)
export COLOR_03="#21B089"           # Green (Command)
export COLOR_04="#FEF02A"           # Yellow (Command second)
export COLOR_05="#589DF6"           # Blue (Path)
export COLOR_06="#944D95"           # Magenta (Syntax var)
export COLOR_07="#1F9EE7"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FA8C8F"           # Bright Red (Command error)
export COLOR_11="#35BB9A"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#589DF6"           # Bright Blue (Folder)
export COLOR_14="#E75699"           # Bright Magenta
export COLOR_15="#3979BC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1D2837"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
