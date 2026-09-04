#!/usr/bin/env bash

export PROFILE_NAME="Swamp Light"

export COLOR_01="#F1E3D1"           # Black (Host)
export COLOR_02="#D09700"           # Red (Syntax string)
export COLOR_03="#908D6A"           # Green (Command)
export COLOR_04="#993333"           # Yellow (Command second)
export COLOR_05="#BF7979"           # Blue (Path)
export COLOR_06="#9E5581"           # Magenta (Syntax var)
export COLOR_07="#D09700"           # Cyan (Prompt)
export COLOR_08="#64513E"           # White

export COLOR_09="#B5A492"           # Bright Black
export COLOR_10="#D09700"           # Bright Red (Command error)
export COLOR_11="#908D6A"           # Bright Green (Exec)
export COLOR_12="#993333"           # Bright Yellow
export COLOR_13="#BF7979"           # Bright Blue (Folder)
export COLOR_14="#9E5581"           # Bright Magenta
export COLOR_15="#D09700"           # Bright Cyan
export COLOR_16="#8C7B68"           # Bright White

export BACKGROUND_COLOR="#F1E3D1"   # Background
export FOREGROUND_COLOR="#64513E"   # Foreground (Text)

export CURSOR_COLOR="#64513E" # Cursor

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
