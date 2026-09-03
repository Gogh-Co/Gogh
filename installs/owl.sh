#!/usr/bin/env bash

export PROFILE_NAME="owl"

export COLOR_01="#302C2C"           # Black (Host)
export COLOR_02="#5A5A5A"           # Red (Syntax string)
export COLOR_03="#989898"           # Green (Command)
export COLOR_04="#CACACA"           # Yellow (Command second)
export COLOR_05="#656565"           # Blue (Path)
export COLOR_06="#B1B1B1"           # Magenta (Syntax var)
export COLOR_07="#7F7F7F"           # Cyan (Prompt)
export COLOR_08="#DEDEDE"           # White

export COLOR_09="#5D595B"           # Bright Black
export COLOR_10="#DA5B2C"           # Bright Red (Command error)
export COLOR_11="#989898"           # Bright Green (Exec)
export COLOR_12="#CACACA"           # Bright Yellow
export COLOR_13="#656565"           # Bright Blue (Folder)
export COLOR_14="#B1B1B1"           # Bright Magenta
export COLOR_15="#7F7F7F"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2F2B2C"   # Background
export FOREGROUND_COLOR="#DEDEDE"   # Foreground (Text)

export CURSOR_COLOR="#DEDEDE" # Cursor

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
