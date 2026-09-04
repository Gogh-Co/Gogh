#!/usr/bin/env bash

export PROFILE_NAME="Lichen Chartreuse Dark"

export COLOR_01="#151613"           # Black (Host)
export COLOR_02="#E28B82"           # Red (Syntax string)
export COLOR_03="#83BDA5"           # Green (Command)
export COLOR_04="#B2D084"           # Yellow (Command second)
export COLOR_05="#78ADC4"           # Blue (Path)
export COLOR_06="#BFA6D4"           # Magenta (Syntax var)
export COLOR_07="#9CC6C9"           # Cyan (Prompt)
export COLOR_08="#E0E5DA"           # White

export COLOR_09="#899282"           # Bright Black
export COLOR_10="#E28B82"           # Bright Red (Command error)
export COLOR_11="#CFE4AE"           # Bright Green (Exec)
export COLOR_12="#D5AD73"           # Bright Yellow
export COLOR_13="#A3B8C2"           # Bright Blue (Folder)
export COLOR_14="#D2A0B2"           # Bright Magenta
export COLOR_15="#97C9C9"           # Bright Cyan
export COLOR_16="#FCFCFA"           # Bright White

export BACKGROUND_COLOR="#151613"   # Background
export FOREGROUND_COLOR="#E0E5DA"   # Foreground (Text)

export CURSOR_COLOR="#E0E5DA" # Cursor

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
