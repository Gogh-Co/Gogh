#!/usr/bin/env bash

export PROFILE_NAME="Tango Adapted"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#59D600"           # Green (Command)
export COLOR_04="#F0CB00"           # Yellow (Command second)
export COLOR_05="#00A2FF"           # Blue (Path)
export COLOR_06="#C17ECC"           # Magenta (Syntax var)
export COLOR_07="#00D0D6"           # Cyan (Prompt)
export COLOR_08="#E6EBE1"           # White

export COLOR_09="#8F928B"           # Bright Black
export COLOR_10="#FF0013"           # Bright Red (Command error)
export COLOR_11="#93FF00"           # Bright Green (Exec)
export COLOR_12="#FFF121"           # Bright Yellow
export COLOR_13="#88C9FF"           # Bright Blue (Folder)
export COLOR_14="#E9A7E1"           # Bright Magenta
export COLOR_15="#00FEFF"           # Bright Cyan
export COLOR_16="#F6F6F4"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
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
