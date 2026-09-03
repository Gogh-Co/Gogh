#!/usr/bin/env bash

export PROFILE_NAME="Acme"

export COLOR_01="#101010"           # Black (Host)
export COLOR_02="#303030"           # Red (Syntax string)
export COLOR_03="#CCCC7C"           # Green (Command)
export COLOR_04="#FFFFCA"           # Yellow (Command second)
export COLOR_05="#EAFFFF"           # Blue (Path)
export COLOR_06="#505050"           # Magenta (Syntax var)
export COLOR_07="#AEEEEE"           # Cyan (Prompt)
export COLOR_08="#FCFCCE"           # White

export COLOR_09="#101010"           # Bright Black
export COLOR_10="#303030"           # Bright Red (Command error)
export COLOR_11="#CCCC7C"           # Bright Green (Exec)
export COLOR_12="#FFFFCA"           # Bright Yellow
export COLOR_13="#EAFFFF"           # Bright Blue (Folder)
export COLOR_14="#505050"           # Bright Magenta
export COLOR_15="#AEEEEE"           # Bright Cyan
export COLOR_16="#FCFCCE"           # Bright White

export BACKGROUND_COLOR="#FFFFEA"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
