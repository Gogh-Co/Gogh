#!/usr/bin/env bash

export PROFILE_NAME="Chinoiserie Night"

export COLOR_01="#1D1D1D"           # Black (Host)
export COLOR_02="#F07C82"           # Red (Syntax string)
export COLOR_03="#B2CF87"           # Green (Command)
export COLOR_04="#F4CE69"           # Yellow (Command second)
export COLOR_05="#8FB2C9"           # Blue (Path)
export COLOR_06="#BE9DB9"           # Magenta (Syntax var)
export COLOR_07="#B0D5DF"           # Cyan (Prompt)
export COLOR_08="#C4CBCF"           # White

export COLOR_09="#918072"           # Bright Black
export COLOR_10="#F07C82"           # Bright Red (Command error)
export COLOR_11="#B2CF87"           # Bright Green (Exec)
export COLOR_12="#F4CE69"           # Bright Yellow
export COLOR_13="#8FB2C9"           # Bright Blue (Folder)
export COLOR_14="#BE9DB9"           # Bright Magenta
export COLOR_15="#B0D5DF"           # Bright Cyan
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
