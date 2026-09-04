#!/usr/bin/env bash

export PROFILE_NAME="Shadotheme"

export COLOR_01="#140A1D"           # Black (Host)
export COLOR_02="#B52A5B"           # Red (Syntax string)
export COLOR_03="#FF4971"           # Green (Command)
export COLOR_04="#8897F4"           # Yellow (Command second)
export COLOR_05="#BD93F9"           # Blue (Path)
export COLOR_06="#E9729D"           # Magenta (Syntax var)
export COLOR_07="#F18FB0"           # Cyan (Prompt)
export COLOR_08="#F1C4E0"           # White

export COLOR_09="#A8899C"           # Bright Black
export COLOR_10="#B52A5B"           # Bright Red (Command error)
export COLOR_11="#FF4971"           # Bright Green (Exec)
export COLOR_12="#8897F4"           # Bright Yellow
export COLOR_13="#BD93F9"           # Bright Blue (Folder)
export COLOR_14="#E9729D"           # Bright Magenta
export COLOR_15="#F18FB0"           # Bright Cyan
export COLOR_16="#F1C4E0"           # Bright White

export BACKGROUND_COLOR="#191724"   # Background
export FOREGROUND_COLOR="#E3C7FC"   # Foreground (Text)

export CURSOR_COLOR="#E3C7FC" # Cursor

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
