#!/usr/bin/env bash

export PROFILE_NAME="Swamp Dark"

export COLOR_01="#242015"           # Black (Host)
export COLOR_02="#DB930D"           # Red (Syntax string)
export COLOR_03="#7A7653"           # Green (Command)
export COLOR_04="#A82D56"           # Yellow (Command second)
export COLOR_05="#C1666B"           # Blue (Path)
export COLOR_06="#91506C"           # Magenta (Syntax var)
export COLOR_07="#DB930D"           # Cyan (Prompt)
export COLOR_08="#D2C3A4"           # White

export COLOR_09="#5F4E41"           # Bright Black
export COLOR_10="#DB930D"           # Bright Red (Command error)
export COLOR_11="#7A7653"           # Bright Green (Exec)
export COLOR_12="#A82D56"           # Bright Yellow
export COLOR_13="#C1666B"           # Bright Blue (Folder)
export COLOR_14="#91506C"           # Bright Magenta
export COLOR_15="#DB930D"           # Bright Cyan
export COLOR_16="#F1E9D0"           # Bright White

export BACKGROUND_COLOR="#242015"   # Background
export FOREGROUND_COLOR="#D2C3A4"   # Foreground (Text)

export CURSOR_COLOR="#D2C3A4" # Cursor

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
