#!/usr/bin/env bash

export PROFILE_NAME="High Contrast"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#00FF00"           # Green (Command)
export COLOR_04="#FFFF00"           # Yellow (Command second)
export COLOR_05="#0000FF"           # Blue (Path)
export COLOR_06="#FF00FF"           # Magenta (Syntax var)
export COLOR_07="#00FFFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FF0000"           # Bright Red (Command error)
export COLOR_11="#00FF00"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#0000FF"           # Bright Blue (Folder)
export COLOR_14="#FF00FF"           # Bright Magenta
export COLOR_15="#00FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#444444"   # Background
export FOREGROUND_COLOR="#DDDDDD"   # Foreground (Text)

export CURSOR_COLOR="#DDDDDD" # Cursor

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
