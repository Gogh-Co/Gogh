#!/usr/bin/env bash

export PROFILE_NAME="Woodland"

export COLOR_01="#231E18"           # Black (Host)
export COLOR_02="#D35C5C"           # Red (Syntax string)
export COLOR_03="#B7BA53"           # Green (Command)
export COLOR_04="#E0AC16"           # Yellow (Command second)
export COLOR_05="#88A4D3"           # Blue (Path)
export COLOR_06="#BB90E2"           # Magenta (Syntax var)
export COLOR_07="#6EB958"           # Cyan (Prompt)
export COLOR_08="#CABCB1"           # White

export COLOR_09="#9D8B70"           # Bright Black
export COLOR_10="#D35C5C"           # Bright Red (Command error)
export COLOR_11="#B7BA53"           # Bright Green (Exec)
export COLOR_12="#E0AC16"           # Bright Yellow
export COLOR_13="#88A4D3"           # Bright Blue (Folder)
export COLOR_14="#BB90E2"           # Bright Magenta
export COLOR_15="#6EB958"           # Bright Cyan
export COLOR_16="#E4D4C8"           # Bright White

export BACKGROUND_COLOR="#231E18"   # Background
export FOREGROUND_COLOR="#CABCB1"   # Foreground (Text)

export CURSOR_COLOR="#CABCB1" # Cursor

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
