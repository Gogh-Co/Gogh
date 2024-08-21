#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Suburb"

export COLOR_01="#1e202f"           # Black (Host)
export COLOR_02="#7586f5"           # Red (Syntax string)
export COLOR_03="#fb6fa9"           # Green (Command)
export COLOR_04="#ffb3d2"           # Yellow (Command second)
export COLOR_05="#8696fd"           # Blue (Path)
export COLOR_06="#fb6fa9"           # Magenta (Syntax var)
export COLOR_07="#a0acfe"           # Cyan (Prompt)
export COLOR_08="#878ba6"           # White

export COLOR_09="#4f5472"           # Bright Black
export COLOR_10="#fe81b5"           # Bright Red (Command error)
export COLOR_11="#292c3d"           # Bright Green (Exec)
export COLOR_12="#444864"           # Bright Yellow
export COLOR_13="#5b6080"           # Bright Blue (Folder)
export COLOR_14="#d2d8fe"           # Bright Magenta
export COLOR_15="#f764a1"           # Bright Cyan
export COLOR_16="#ebedff"           # Bright White

export BACKGROUND_COLOR="#1e202f"   # Background
export FOREGROUND_COLOR="#878ba6"   # Foreground (Text)

export CURSOR_COLOR="#d14781" # Cursor

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
