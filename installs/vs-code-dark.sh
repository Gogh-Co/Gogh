#!/usr/bin/env bash

export PROFILE_NAME="Vs Code Dark+"

export COLOR_01="#6A787A"           # Black (Host)
export COLOR_02="#E9653B"           # Red (Syntax string)
export COLOR_03="#39E9A8"           # Green (Command)
export COLOR_04="#E5B684"           # Yellow (Command second)
export COLOR_05="#44AAE6"           # Blue (Path)
export COLOR_06="#E17599"           # Magenta (Syntax var)
export COLOR_07="#3DD5E7"           # Cyan (Prompt)
export COLOR_08="#C3DDE1"           # White

export COLOR_09="#598489"           # Bright Black
export COLOR_10="#E65029"           # Bright Red (Command error)
export COLOR_11="#00FF9A"           # Bright Green (Exec)
export COLOR_12="#E89440"           # Bright Yellow
export COLOR_13="#009AFB"           # Bright Blue (Folder)
export COLOR_14="#FF578F"           # Bright Magenta
export COLOR_15="#5FFFFF"           # Bright Cyan
export COLOR_16="#D9FBFF"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
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
