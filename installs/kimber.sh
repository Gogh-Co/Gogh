#!/usr/bin/env bash

export PROFILE_NAME="Kimber"

export COLOR_01="#222222"           # Black (Host)
export COLOR_02="#C88C8C"           # Red (Syntax string)
export COLOR_03="#99C899"           # Green (Command)
export COLOR_04="#D8B56D"           # Yellow (Command second)
export COLOR_05="#537C9C"           # Blue (Path)
export COLOR_06="#86CACD"           # Magenta (Syntax var)
export COLOR_07="#78B4B4"           # Cyan (Prompt)
export COLOR_08="#DEDEE7"           # White

export COLOR_09="#644646"           # Bright Black
export COLOR_10="#C88C8C"           # Bright Red (Command error)
export COLOR_11="#99C899"           # Bright Green (Exec)
export COLOR_12="#D8B56D"           # Bright Yellow
export COLOR_13="#537C9C"           # Bright Blue (Folder)
export COLOR_14="#86CACD"           # Bright Magenta
export COLOR_15="#78B4B4"           # Bright Cyan
export COLOR_16="#FFFFE6"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#DEDEE7"   # Foreground (Text)

export CURSOR_COLOR="#DEDEE7" # Cursor

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
