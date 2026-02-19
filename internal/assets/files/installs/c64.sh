#!/usr/bin/env bash

export PROFILE_NAME="C64"

export COLOR_01="#090300"           # Black (Host)
export COLOR_02="#883932"           # Red (Syntax string)
export COLOR_03="#55A049"           # Green (Command)
export COLOR_04="#BFCE72"           # Yellow (Command second)
export COLOR_05="#40318D"           # Blue (Path)
export COLOR_06="#8B3F96"           # Magenta (Syntax var)
export COLOR_07="#67B6BD"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#883932"           # Bright Red (Command error)
export COLOR_11="#55A049"           # Bright Green (Exec)
export COLOR_12="#BFCE72"           # Bright Yellow
export COLOR_13="#40318D"           # Bright Blue (Folder)
export COLOR_14="#8B3F96"           # Bright Magenta
export COLOR_15="#67B6BD"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#40318D"   # Background
export FOREGROUND_COLOR="#7869C4"   # Foreground (Text)

export CURSOR_COLOR="#7869C4" # Cursor

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
