#!/usr/bin/env bash

export PROFILE_NAME="Kimbie Light"

export COLOR_01="#FBEBD4"           # Black (Host)
export COLOR_02="#D43552"           # Red (Syntax string)
export COLOR_03="#B8BB26"           # Green (Command)
export COLOR_04="#F0C674"           # Yellow (Command second)
export COLOR_05="#7CAFC2"           # Blue (Path)
export COLOR_06="#D3869B"           # Magenta (Syntax var)
export COLOR_07="#8ABEB7"           # Cyan (Prompt)
export COLOR_08="#6E5346"           # White

export COLOR_09="#F7E4C6"           # Bright Black
export COLOR_10="#D43552"           # Bright Red (Command error)
export COLOR_11="#B8BB26"           # Bright Green (Exec)
export COLOR_12="#F0C674"           # Bright Yellow
export COLOR_13="#7CAFC2"           # Bright Blue (Folder)
export COLOR_14="#D3869B"           # Bright Magenta
export COLOR_15="#8ABEB7"           # Bright Cyan
export COLOR_16="#4A3631"           # Bright White

export BACKGROUND_COLOR="#FBEBD4"   # Background
export FOREGROUND_COLOR="#6E5346"   # Foreground (Text)

export CURSOR_COLOR="#6E5346" # Cursor

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
