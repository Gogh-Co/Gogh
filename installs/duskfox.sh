#!/usr/bin/env bash

export PROFILE_NAME="Duskfox"

export COLOR_01="#393552"           # Black (Host)
export COLOR_02="#EB6F92"           # Red (Syntax string)
export COLOR_03="#A3BE8C"           # Green (Command)
export COLOR_04="#F6C177"           # Yellow (Command second)
export COLOR_05="#569FBA"           # Blue (Path)
export COLOR_06="#C4A7E7"           # Magenta (Syntax var)
export COLOR_07="#9CCFD8"           # Cyan (Prompt)
export COLOR_08="#E0DEF4"           # White

export COLOR_09="#47407D"           # Bright Black
export COLOR_10="#F083A2"           # Bright Red (Command error)
export COLOR_11="#B1D196"           # Bright Green (Exec)
export COLOR_12="#F9CB8C"           # Bright Yellow
export COLOR_13="#65B1CD"           # Bright Blue (Folder)
export COLOR_14="#CCB1ED"           # Bright Magenta
export COLOR_15="#A6DAE3"           # Bright Cyan
export COLOR_16="#E2E0F7"           # Bright White

export BACKGROUND_COLOR="#232136"   # Background
export FOREGROUND_COLOR="#E0DEF4"   # Foreground (Text)

export CURSOR_COLOR="#E0DEF4" # Cursor

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
