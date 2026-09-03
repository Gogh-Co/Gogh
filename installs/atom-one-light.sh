#!/usr/bin/env bash

export PROFILE_NAME="Atom One Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#DE3E35"           # Red (Syntax string)
export COLOR_03="#3F953A"           # Green (Command)
export COLOR_04="#D2B67C"           # Yellow (Command second)
export COLOR_05="#2F5AF3"           # Blue (Path)
export COLOR_06="#950095"           # Magenta (Syntax var)
export COLOR_07="#3F953A"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#DE3E35"           # Bright Red (Command error)
export COLOR_11="#3F953A"           # Bright Green (Exec)
export COLOR_12="#D2B67C"           # Bright Yellow
export COLOR_13="#2F5AF3"           # Bright Blue (Folder)
export COLOR_14="#A00095"           # Bright Magenta
export COLOR_15="#3F953A"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#F9F9F9"   # Background
export FOREGROUND_COLOR="#2A2C33"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
