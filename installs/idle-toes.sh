#!/usr/bin/env bash

export PROFILE_NAME="Idle Toes"

export COLOR_01="#323232"           # Black (Host)
export COLOR_02="#D25252"           # Red (Syntax string)
export COLOR_03="#7FE173"           # Green (Command)
export COLOR_04="#FFC66D"           # Yellow (Command second)
export COLOR_05="#4099FF"           # Blue (Path)
export COLOR_06="#F680FF"           # Magenta (Syntax var)
export COLOR_07="#BED6FF"           # Cyan (Prompt)
export COLOR_08="#EEEEEC"           # White

export COLOR_09="#535353"           # Bright Black
export COLOR_10="#F07070"           # Bright Red (Command error)
export COLOR_11="#9DFF91"           # Bright Green (Exec)
export COLOR_12="#FFE48B"           # Bright Yellow
export COLOR_13="#5EB7F7"           # Bright Blue (Folder)
export COLOR_14="#FF9DFF"           # Bright Magenta
export COLOR_15="#DCF4FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#323232"   # Background
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
