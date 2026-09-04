#!/usr/bin/env bash

export PROFILE_NAME="Decaf"

export COLOR_01="#2D2D2D"           # Black (Host)
export COLOR_02="#FF7F7B"           # Red (Syntax string)
export COLOR_03="#BEDA78"           # Green (Command)
export COLOR_04="#FFD67C"           # Yellow (Command second)
export COLOR_05="#90BEE1"           # Blue (Path)
export COLOR_06="#EFB3F7"           # Magenta (Syntax var)
export COLOR_07="#BED6FF"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#FF7F7B"           # Bright Red (Command error)
export COLOR_11="#BEDA78"           # Bright Green (Exec)
export COLOR_12="#FFD67C"           # Bright Yellow
export COLOR_13="#90BEE1"           # Bright Blue (Folder)
export COLOR_14="#EFB3F7"           # Bright Magenta
export COLOR_15="#BED6FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2D2D2D"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCC" # Cursor

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
