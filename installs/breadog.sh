#!/usr/bin/env bash

export PROFILE_NAME="Breadog"

export COLOR_01="#362C24"           # Black (Host)
export COLOR_02="#B10B00"           # Red (Syntax string)
export COLOR_03="#007232"           # Green (Command)
export COLOR_04="#8B4C00"           # Yellow (Command second)
export COLOR_05="#005CB4"           # Blue (Path)
export COLOR_06="#9B0097"           # Magenta (Syntax var)
export COLOR_07="#006A78"           # Cyan (Prompt)
export COLOR_08="#D4C3B7"           # White

export COLOR_09="#514337"           # Bright Black
export COLOR_10="#DE1100"           # Bright Red (Command error)
export COLOR_11="#008F40"           # Bright Green (Exec)
export COLOR_12="#AE6000"           # Bright Yellow
export COLOR_13="#0074E1"           # Bright Blue (Folder)
export COLOR_14="#C300BD"           # Bright Magenta
export COLOR_15="#008697"           # Bright Cyan
export COLOR_16="#EAE1DA"           # Bright White

export BACKGROUND_COLOR="#F1EBE6"   # Background
export FOREGROUND_COLOR="#362C24"   # Foreground (Text)

export CURSOR_COLOR="#362C24" # Cursor

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
