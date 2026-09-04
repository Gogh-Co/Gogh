#!/usr/bin/env bash

export PROFILE_NAME="Min Dark"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#F97583"           # Red (Syntax string)
export COLOR_03="#85E89D"           # Green (Command)
export COLOR_04="#FFAB70"           # Yellow (Command second)
export COLOR_05="#79B8FF"           # Blue (Path)
export COLOR_06="#F97583"           # Magenta (Syntax var)
export COLOR_07="#9DB1C5"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#5C5C5C"           # Bright Black
export COLOR_10="#FF7A84"           # Bright Red (Command error)
export COLOR_11="#85E89D"           # Bright Green (Exec)
export COLOR_12="#FF9800"           # Bright Yellow
export COLOR_13="#B392F0"           # Bright Blue (Folder)
export COLOR_14="#FF7A84"           # Bright Magenta
export COLOR_15="#79B8FF"           # Bright Cyan
export COLOR_16="#F8F8F8"           # Bright White

export BACKGROUND_COLOR="#1F1F1F"   # Background
export FOREGROUND_COLOR="#F8F8F8"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F8" # Cursor

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
