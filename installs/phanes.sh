#!/usr/bin/env bash

export PROFILE_NAME="Phanes"

export COLOR_01="#222021"           # Black (Host)
export COLOR_02="#6E5B86"           # Red (Syntax string)
export COLOR_03="#CCA133"           # Green (Command)
export COLOR_04="#FFCC4D"           # Yellow (Command second)
export COLOR_05="#8B78A3"           # Blue (Path)
export COLOR_06="#CCA133"           # Magenta (Syntax var)
export COLOR_07="#9067CF"           # Cyan (Prompt)
export COLOR_08="#9F999B"           # White

export COLOR_09="#635F60"           # Bright Black
export COLOR_10="#DDAF3C"           # Bright Red (Command error)
export COLOR_11="#2F2D2E"           # Bright Green (Exec)
export COLOR_12="#565254"           # Bright Yellow
export COLOR_13="#706B6D"           # Bright Blue (Folder)
export COLOR_14="#B28CE7"           # Bright Magenta
export COLOR_15="#C39622"           # Bright Cyan
export COLOR_16="#FFEBF2"           # Bright White

export BACKGROUND_COLOR="#222021"   # Background
export FOREGROUND_COLOR="#9F999B"   # Foreground (Text)

export CURSOR_COLOR="#9F999B" # Cursor

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
