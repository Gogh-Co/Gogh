#!/usr/bin/env bash

export PROFILE_NAME="Seti"

export COLOR_01="#323232"           # Black (Host)
export COLOR_02="#C22832"           # Red (Syntax string)
export COLOR_03="#8EC43D"           # Green (Command)
export COLOR_04="#E0C64F"           # Yellow (Command second)
export COLOR_05="#43A5D5"           # Blue (Path)
export COLOR_06="#8B57B5"           # Magenta (Syntax var)
export COLOR_07="#8EC43D"           # Cyan (Prompt)
export COLOR_08="#EEEEEE"           # White

export COLOR_09="#323232"           # Bright Black
export COLOR_10="#C22832"           # Bright Red (Command error)
export COLOR_11="#8EC43D"           # Bright Green (Exec)
export COLOR_12="#E0C64F"           # Bright Yellow
export COLOR_13="#43A5D5"           # Bright Blue (Folder)
export COLOR_14="#8B57B5"           # Bright Magenta
export COLOR_15="#8EC43D"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#111213"   # Background
export FOREGROUND_COLOR="#CACECD"   # Foreground (Text)

export CURSOR_COLOR="#CACECD" # Cursor

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
