#!/usr/bin/env bash

export PROFILE_NAME="Atelier Lakeside Light"

export COLOR_01="#EBF8FF"           # Black (Host)
export COLOR_02="#D22D72"           # Red (Syntax string)
export COLOR_03="#568C3B"           # Green (Command)
export COLOR_04="#8A8A0F"           # Yellow (Command second)
export COLOR_05="#257FAD"           # Blue (Path)
export COLOR_06="#6B6BB8"           # Magenta (Syntax var)
export COLOR_07="#2D8F6F"           # Cyan (Prompt)
export COLOR_08="#516D7B"           # White

export COLOR_09="#7195A8"           # Bright Black
export COLOR_10="#D22D72"           # Bright Red (Command error)
export COLOR_11="#568C3B"           # Bright Green (Exec)
export COLOR_12="#8A8A0F"           # Bright Yellow
export COLOR_13="#257FAD"           # Bright Blue (Folder)
export COLOR_14="#6B6BB8"           # Bright Magenta
export COLOR_15="#2D8F6F"           # Bright Cyan
export COLOR_16="#161B1D"           # Bright White

export BACKGROUND_COLOR="#EBF8FF"   # Background
export FOREGROUND_COLOR="#516D7B"   # Foreground (Text)

export CURSOR_COLOR="#516D7B" # Cursor

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
