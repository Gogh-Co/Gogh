#!/usr/bin/env bash

export PROFILE_NAME="Material Vivid"

export COLOR_01="#202124"           # Black (Host)
export COLOR_02="#F44336"           # Red (Syntax string)
export COLOR_03="#00E676"           # Green (Command)
export COLOR_04="#FFEB3B"           # Yellow (Command second)
export COLOR_05="#2196F3"           # Blue (Path)
export COLOR_06="#673AB7"           # Magenta (Syntax var)
export COLOR_07="#00BCD4"           # Cyan (Prompt)
export COLOR_08="#80868B"           # White

export COLOR_09="#44464D"           # Bright Black
export COLOR_10="#F44336"           # Bright Red (Command error)
export COLOR_11="#00E676"           # Bright Green (Exec)
export COLOR_12="#FFEB3B"           # Bright Yellow
export COLOR_13="#2196F3"           # Bright Blue (Folder)
export COLOR_14="#673AB7"           # Bright Magenta
export COLOR_15="#00BCD4"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#202124"   # Background
export FOREGROUND_COLOR="#80868B"   # Foreground (Text)

export CURSOR_COLOR="#80868B" # Cursor

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
