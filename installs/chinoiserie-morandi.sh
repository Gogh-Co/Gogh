#!/usr/bin/env bash

export PROFILE_NAME="Chinoiserie Morandi"

export COLOR_01="#1D1D1D"           # Black (Host)
export COLOR_02="#C06061"           # Red (Syntax string)
export COLOR_03="#8CA07B"           # Green (Command)
export COLOR_04="#E5BC84"           # Yellow (Command second)
export COLOR_05="#839EC9"           # Blue (Path)
export COLOR_06="#98A1D8"           # Magenta (Syntax var)
export COLOR_07="#5E8C9B"           # Cyan (Prompt)
export COLOR_08="#C4CBCF"           # White

export COLOR_09="#918072"           # Bright Black
export COLOR_10="#C06061"           # Bright Red (Command error)
export COLOR_11="#8CA07B"           # Bright Green (Exec)
export COLOR_12="#E5BC84"           # Bright Yellow
export COLOR_13="#839EC9"           # Bright Blue (Folder)
export COLOR_14="#98A1D8"           # Bright Magenta
export COLOR_15="#5E8C9B"           # Bright Cyan
export COLOR_16="#FFFEF9"           # Bright White

export BACKGROUND_COLOR="#1D1D1D"   # Background
export FOREGROUND_COLOR="#C4CBCF"   # Foreground (Text)

export CURSOR_COLOR="#C4CBCF" # Cursor

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
