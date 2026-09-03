#!/usr/bin/env bash

export PROFILE_NAME="Firewatch"

export COLOR_01="#585F6D"           # Black (Host)
export COLOR_02="#D95360"           # Red (Syntax string)
export COLOR_03="#5AB977"           # Green (Command)
export COLOR_04="#DFB563"           # Yellow (Command second)
export COLOR_05="#4D89C4"           # Blue (Path)
export COLOR_06="#D55119"           # Magenta (Syntax var)
export COLOR_07="#44A8B6"           # Cyan (Prompt)
export COLOR_08="#E6E5FF"           # White

export COLOR_09="#585F6D"           # Bright Black
export COLOR_10="#D95360"           # Bright Red (Command error)
export COLOR_11="#5AB977"           # Bright Green (Exec)
export COLOR_12="#DFB563"           # Bright Yellow
export COLOR_13="#4C89C5"           # Bright Blue (Folder)
export COLOR_14="#D55119"           # Bright Magenta
export COLOR_15="#44A8B6"           # Bright Cyan
export COLOR_16="#E6E5FF"           # Bright White

export BACKGROUND_COLOR="#1E2027"   # Background
export FOREGROUND_COLOR="#9BA2B2"   # Foreground (Text)

export CURSOR_COLOR="#F6F7EC" # Cursor

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
