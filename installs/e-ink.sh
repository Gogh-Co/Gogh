#!/usr/bin/env bash

export PROFILE_NAME="E Ink"

export COLOR_01="#CCCCCC"           # Black (Host)
export COLOR_02="#333333"           # Red (Syntax string)
export COLOR_03="#9A9A9A"           # Green (Command)
export COLOR_04="#868686"           # Yellow (Command second)
export COLOR_05="#727272"           # Blue (Path)
export COLOR_06="#AEAEAE"           # Magenta (Syntax var)
export COLOR_07="#4A4A4A"           # Cyan (Prompt)
export COLOR_08="#5E5E5E"           # White

export COLOR_09="#5E5E5E"           # Bright Black
export COLOR_10="#333333"           # Bright Red (Command error)
export COLOR_11="#9A9A9A"           # Bright Green (Exec)
export COLOR_12="#868686"           # Bright Yellow
export COLOR_13="#727272"           # Bright Blue (Folder)
export COLOR_14="#AEAEAE"           # Bright Magenta
export COLOR_15="#4A4A4A"           # Bright Cyan
export COLOR_16="#7C7C7C"           # Bright White

export BACKGROUND_COLOR="#CCCCCC"   # Background
export FOREGROUND_COLOR="#474747"   # Foreground (Text)

export CURSOR_COLOR="#474747" # Cursor

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
