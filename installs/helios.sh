#!/usr/bin/env bash

export PROFILE_NAME="Helios"

export COLOR_01="#1D2021"           # Black (Host)
export COLOR_02="#D72638"           # Red (Syntax string)
export COLOR_03="#88B92D"           # Green (Command)
export COLOR_04="#F19D1A"           # Yellow (Command second)
export COLOR_05="#1E8BAC"           # Blue (Path)
export COLOR_06="#BE4264"           # Magenta (Syntax var)
export COLOR_07="#1BA595"           # Cyan (Prompt)
export COLOR_08="#D5D5D5"           # White

export COLOR_09="#6F7579"           # Bright Black
export COLOR_10="#D72638"           # Bright Red (Command error)
export COLOR_11="#88B92D"           # Bright Green (Exec)
export COLOR_12="#F19D1A"           # Bright Yellow
export COLOR_13="#1E8BAC"           # Bright Blue (Folder)
export COLOR_14="#BE4264"           # Bright Magenta
export COLOR_15="#1BA595"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#1D2021"   # Background
export FOREGROUND_COLOR="#D5D5D5"   # Foreground (Text)

export CURSOR_COLOR="#D5D5D5" # Cursor

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
