#!/usr/bin/env bash

export PROFILE_NAME="Apathy"

export COLOR_01="#031A16"           # Black (Host)
export COLOR_02="#3E9688"           # Red (Syntax string)
export COLOR_03="#883E96"           # Green (Command)
export COLOR_04="#3E4C96"           # Yellow (Command second)
export COLOR_05="#96883E"           # Blue (Path)
export COLOR_06="#4C963E"           # Magenta (Syntax var)
export COLOR_07="#963E4C"           # Cyan (Prompt)
export COLOR_08="#81B5AC"           # White

export COLOR_09="#2B685E"           # Bright Black
export COLOR_10="#3E9688"           # Bright Red (Command error)
export COLOR_11="#883E96"           # Bright Green (Exec)
export COLOR_12="#3E4C96"           # Bright Yellow
export COLOR_13="#96883E"           # Bright Blue (Folder)
export COLOR_14="#4C963E"           # Bright Magenta
export COLOR_15="#963E4C"           # Bright Cyan
export COLOR_16="#D2E7E4"           # Bright White

export BACKGROUND_COLOR="#031A16"   # Background
export FOREGROUND_COLOR="#81B5AC"   # Foreground (Text)

export CURSOR_COLOR="#81B5AC" # Cursor

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
