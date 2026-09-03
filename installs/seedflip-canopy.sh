#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Canopy"

export COLOR_01="#0B110F"           # Black (Host)
export COLOR_02="#D65C5C"           # Red (Syntax string)
export COLOR_03="#5CD685"           # Green (Command)
export COLOR_04="#D6C25C"           # Yellow (Command second)
export COLOR_05="#5C8FD6"           # Blue (Path)
export COLOR_06="#D65CD6"           # Magenta (Syntax var)
export COLOR_07="#5CD6D6"           # Cyan (Prompt)
export COLOR_08="#FAFAFA"           # White

export COLOR_09="#2D453C"           # Bright Black
export COLOR_10="#E69999"           # Bright Red (Command error)
export COLOR_11="#99E6B2"           # Bright Green (Exec)
export COLOR_12="#E6D999"           # Bright Yellow
export COLOR_13="#99B9E6"           # Bright Blue (Folder)
export COLOR_14="#E699E6"           # Bright Magenta
export COLOR_15="#99E6E6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0F1714"   # Background
export FOREGROUND_COLOR="#EDEDED"   # Foreground (Text)

export CURSOR_COLOR="#3ECF8E" # Cursor

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
