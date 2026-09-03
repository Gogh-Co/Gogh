#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Wavelength"

export COLOR_01="#090C10"           # Black (Host)
export COLOR_02="#D55D5D"           # Red (Syntax string)
export COLOR_03="#5DD585"           # Green (Command)
export COLOR_04="#D5C15D"           # Yellow (Command second)
export COLOR_05="#5D8FD5"           # Blue (Path)
export COLOR_06="#D55DD5"           # Magenta (Syntax var)
export COLOR_07="#5DD5D5"           # Cyan (Prompt)
export COLOR_08="#F7F9FB"           # White

export COLOR_09="#364255"           # Bright Black
export COLOR_10="#E59A9A"           # Bright Red (Command error)
export COLOR_11="#9AE5B3"           # Bright Green (Exec)
export COLOR_12="#E5D89A"           # Bright Yellow
export COLOR_13="#9AB9E5"           # Bright Blue (Folder)
export COLOR_14="#E59AE5"           # Bright Magenta
export COLOR_15="#9AE5E5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D1117"   # Background
export FOREGROUND_COLOR="#E6EDF3"   # Foreground (Text)

export CURSOR_COLOR="#238636" # Cursor

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
