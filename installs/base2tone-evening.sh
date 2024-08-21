#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Evening"

export COLOR_01="#2a2734"           # Black (Host)
export COLOR_02="#8a75f5"           # Red (Syntax string)
export COLOR_03="#ffad5c"           # Green (Command)
export COLOR_04="#ffcc99"           # Yellow (Command second)
export COLOR_05="#9a86fd"           # Blue (Path)
export COLOR_06="#ffad5c"           # Magenta (Syntax var)
export COLOR_07="#afa0fe"           # Cyan (Prompt)
export COLOR_08="#a4a1b5"           # White

export COLOR_09="#6c6783"           # Bright Black
export COLOR_10="#ffb870"           # Bright Red (Command error)
export COLOR_11="#363342"           # Bright Green (Exec)
export COLOR_12="#545167"           # Bright Yellow
export COLOR_13="#787391"           # Bright Blue (Folder)
export COLOR_14="#d9d2fe"           # Bright Magenta
export COLOR_15="#ffa142"           # Bright Cyan
export COLOR_16="#eeebff"           # Bright White

export BACKGROUND_COLOR="#2a2734"   # Background
export FOREGROUND_COLOR="#a4a1b5"   # Foreground (Text)

export CURSOR_COLOR="#b37537" # Cursor

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
