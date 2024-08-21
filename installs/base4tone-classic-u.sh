#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic U"

export COLOR_01="#201d20"           # Black (Host)
export COLOR_02="#ce672c"           # Red (Syntax string)
export COLOR_03="#aa52e0"           # Green (Command)
export COLOR_04="#c988f2"           # Yellow (Command second)
export COLOR_05="#eb75dd"           # Blue (Path)
export COLOR_06="#e96375"           # Magenta (Syntax var)
export COLOR_07="#ba6cea"           # Cyan (Prompt)
export COLOR_08="#ede8ed"           # White

export COLOR_09="#0d070c"           # Bright Black
export COLOR_10="#e78b55"           # Bright Red (Command error)
export COLOR_11="#d19af4"           # Bright Green (Exec)
export COLOR_12="#e0baf7"           # Bright Yellow
export COLOR_13="#f8c3f2"           # Bright Blue (Folder)
export COLOR_14="#f17e8e"           # Bright Magenta
export COLOR_15="#f6b1ee"           # Bright Cyan
export COLOR_16="#f9f6f8"           # Bright White

export BACKGROUND_COLOR="#201d20"   # Background
export FOREGROUND_COLOR="#9e949d"   # Foreground (Text)

export CURSOR_COLOR="#7c7481" # Cursor

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
