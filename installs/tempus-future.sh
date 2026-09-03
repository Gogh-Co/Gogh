#!/usr/bin/env bash

export PROFILE_NAME="Tempus Future"

export COLOR_01="#090A18"           # Black (Host)
export COLOR_02="#FF7E8F"           # Red (Syntax string)
export COLOR_03="#6ABA39"           # Green (Command)
export COLOR_04="#BFA51A"           # Yellow (Command second)
export COLOR_05="#4AB2D7"           # Blue (Path)
export COLOR_06="#E58F84"           # Magenta (Syntax var)
export COLOR_07="#2AB7BB"           # Cyan (Prompt)
export COLOR_08="#A7A2C4"           # White

export COLOR_09="#2B1329"           # Bright Black
export COLOR_10="#F78E2F"           # Bright Red (Command error)
export COLOR_11="#60BA80"           # Bright Green (Exec)
export COLOR_12="#DE9B1D"           # Bright Yellow
export COLOR_13="#8BA7EA"           # Bright Blue (Folder)
export COLOR_14="#E08BD6"           # Bright Magenta
export COLOR_15="#2CBAB6"           # Bright Cyan
export COLOR_16="#B4ABAC"           # Bright White

export BACKGROUND_COLOR="#090A18"   # Background
export FOREGROUND_COLOR="#B4ABAC"   # Foreground (Text)

export CURSOR_COLOR="#B4ABAC" # Cursor

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
