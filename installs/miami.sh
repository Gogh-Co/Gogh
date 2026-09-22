#!/usr/bin/env bash

export PROFILE_NAME="Miami"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF4C8B"           # Red (Syntax string)
export COLOR_03="#7FFFD4"           # Green (Command)
export COLOR_04="#FFD84C"           # Yellow (Command second)
export COLOR_05="#00FFA8"           # Blue (Path)
export COLOR_06="#D36CFF"           # Magenta (Syntax var)
export COLOR_07="#47CFFF"           # Cyan (Prompt)
export COLOR_08="#F7F1FF"           # White

export COLOR_09="#69676C"           # Bright Black
export COLOR_10="#FF4C8B"           # Bright Red (Command error)
export COLOR_11="#7FFFD4"           # Bright Green (Exec)
export COLOR_12="#FFD84C"           # Bright Yellow
export COLOR_13="#00FFA8"           # Bright Blue (Folder)
export COLOR_14="#D36CFF"           # Bright Magenta
export COLOR_15="#47CFFF"           # Bright Cyan
export COLOR_16="#F7F1FF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#F7F1FF"   # Foreground (Text)

export CURSOR_COLOR="#F7F1FF" # Cursor

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
