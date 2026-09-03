#!/usr/bin/env bash

export PROFILE_NAME="Karasu Night"

export COLOR_01="#0A0A0A"           # Black (Host)
export COLOR_02="#E06C75"           # Red (Syntax string)
export COLOR_03="#8FBF7A"           # Green (Command)
export COLOR_04="#D4B86A"           # Yellow (Command second)
export COLOR_05="#7AA2C8"           # Blue (Path)
export COLOR_06="#B4A1D8"           # Magenta (Syntax var)
export COLOR_07="#76B7B2"           # Cyan (Prompt)
export COLOR_08="#F5F5F5"           # White

export COLOR_09="#44403C"           # Bright Black
export COLOR_10="#FF5C5C"           # Bright Red (Command error)
export COLOR_11="#A6D189"           # Bright Green (Exec)
export COLOR_12="#E8D07D"           # Bright Yellow
export COLOR_13="#8CB4E2"           # Bright Blue (Folder)
export COLOR_14="#C7B3EE"           # Bright Magenta
export COLOR_15="#8AD4CE"           # Bright Cyan
export COLOR_16="#E7E5E4"           # Bright White

export BACKGROUND_COLOR="#0A0A0A"   # Background
export FOREGROUND_COLOR="#E7E5E4"   # Foreground (Text)

export CURSOR_COLOR="#F5F5F5" # Cursor

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
