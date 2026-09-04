#!/usr/bin/env bash

export PROFILE_NAME="School Boy Mono"

export COLOR_01="#174715"           # Black (Host)
export COLOR_02="#BFBFBF"           # Red (Syntax string)
export COLOR_03="#BFBFBF"           # Green (Command)
export COLOR_04="#BFBFBF"           # Yellow (Command second)
export COLOR_05="#BFBFBF"           # Blue (Path)
export COLOR_06="#BFBFBF"           # Magenta (Syntax var)
export COLOR_07="#BFBFBF"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#21631E"           # Bright Black
export COLOR_10="#DDDDDD"           # Bright Red (Command error)
export COLOR_11="#DDDDDD"           # Bright Green (Exec)
export COLOR_12="#DDDDDD"           # Bright Yellow
export COLOR_13="#DDDDDD"           # Bright Blue (Folder)
export COLOR_14="#DDDDDD"           # Bright Magenta
export COLOR_15="#DDDDDD"           # Bright Cyan
export COLOR_16="#DDDDDD"           # Bright White

export BACKGROUND_COLOR="#0B230A"   # Background
export FOREGROUND_COLOR="#BFBFBF"   # Foreground (Text)

export CURSOR_COLOR="#BFBFBF" # Cursor

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
