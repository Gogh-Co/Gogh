#!/usr/bin/env bash

export PROFILE_NAME="Paper"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#cc3e28"           # Red (Syntax string)
export COLOR_03="#216609"           # Green (Command)
export COLOR_04="#b58900"           # Yellow (Command second)
export COLOR_05="#1e6fcc"           # Blue (Path)
export COLOR_06="#5c21a5"           # Magenta (Syntax var)
export COLOR_07="#158c86"           # Cyan (Prompt)
export COLOR_08="#aaaaaa"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#cc3e28"           # Bright Red (Command error)
export COLOR_11="#216609"           # Bright Green (Exec)
export COLOR_12="#b58900"           # Bright Yellow
export COLOR_13="#1e6fcc"           # Bright Blue (Folder)
export COLOR_14="#5c21a5"           # Bright Magenta
export COLOR_15="#158c86"           # Bright Cyan
export COLOR_16="#aaaaaa"           # Bright White

export BACKGROUND_COLOR="#f2eede"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
