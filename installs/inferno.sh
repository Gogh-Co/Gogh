#!/usr/bin/env bash

export PROFILE_NAME="Inferno"

export COLOR_01="#330000"           # Black (Host)
export COLOR_02="#FF3300"           # Red (Syntax string)
export COLOR_03="#FF6600"           # Green (Command)
export COLOR_04="#FF9900"           # Yellow (Command second)
export COLOR_05="#FFCC00"           # Blue (Path)
export COLOR_06="#FF6600"           # Magenta (Syntax var)
export COLOR_07="#FF9900"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#663300"           # Bright Black
export COLOR_10="#FF6633"           # Bright Red (Command error)
export COLOR_11="#FF9966"           # Bright Green (Exec)
export COLOR_12="#FFCC99"           # Bright Yellow
export COLOR_13="#FFCC33"           # Bright Blue (Folder)
export COLOR_14="#FF9966"           # Bright Magenta
export COLOR_15="#FFCC99"           # Bright Cyan
export COLOR_16="#D9D9D9"           # Bright White

export BACKGROUND_COLOR="#270D06"   # Background
export FOREGROUND_COLOR="#D9D9D9"   # Foreground (Text)

export CURSOR_COLOR="#D9D9D9" # Cursor

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
