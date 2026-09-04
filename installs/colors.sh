#!/usr/bin/env bash

export PROFILE_NAME="Colors"

export COLOR_01="#111111"           # Black (Host)
export COLOR_02="#FF4136"           # Red (Syntax string)
export COLOR_03="#2ECC40"           # Green (Command)
export COLOR_04="#FFDC00"           # Yellow (Command second)
export COLOR_05="#0074D9"           # Blue (Path)
export COLOR_06="#B10DC9"           # Magenta (Syntax var)
export COLOR_07="#7FDBFF"           # Cyan (Prompt)
export COLOR_08="#BBBBBB"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#FF4136"           # Bright Red (Command error)
export COLOR_11="#2ECC40"           # Bright Green (Exec)
export COLOR_12="#FFDC00"           # Bright Yellow
export COLOR_13="#0074D9"           # Bright Blue (Folder)
export COLOR_14="#B10DC9"           # Bright Magenta
export COLOR_15="#7FDBFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#111111"   # Background
export FOREGROUND_COLOR="#BBBBBB"   # Foreground (Text)

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
