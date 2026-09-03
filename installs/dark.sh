#!/usr/bin/env bash

export PROFILE_NAME="Dark+"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CD3131"           # Red (Syntax string)
export COLOR_03="#0DBC79"           # Green (Command)
export COLOR_04="#E5E510"           # Yellow (Command second)
export COLOR_05="#2472C8"           # Blue (Path)
export COLOR_06="#BC3FBC"           # Magenta (Syntax var)
export COLOR_07="#11A8CD"           # Cyan (Prompt)
export COLOR_08="#E5E5E5"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#F14C4C"           # Bright Red (Command error)
export COLOR_11="#23D18B"           # Bright Green (Exec)
export COLOR_12="#F5F543"           # Bright Yellow
export COLOR_13="#3B8EEA"           # Bright Blue (Folder)
export COLOR_14="#D670D6"           # Bright Magenta
export COLOR_15="#29B8DB"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#CCCCCC"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
