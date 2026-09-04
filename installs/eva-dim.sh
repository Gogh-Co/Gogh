#!/usr/bin/env bash

export PROFILE_NAME="Eva Dim"

export COLOR_01="#2A3B4D"           # Black (Host)
export COLOR_02="#C4676C"           # Red (Syntax string)
export COLOR_03="#5DE561"           # Green (Command)
export COLOR_04="#CFD05D"           # Yellow (Command second)
export COLOR_05="#1AE1DC"           # Blue (Path)
export COLOR_06="#9C6CD3"           # Magenta (Syntax var)
export COLOR_07="#4B8F77"           # Cyan (Prompt)
export COLOR_08="#9FA2A6"           # White

export COLOR_09="#55799C"           # Bright Black
export COLOR_10="#C4676C"           # Bright Red (Command error)
export COLOR_11="#5DE561"           # Bright Green (Exec)
export COLOR_12="#CFD05D"           # Bright Yellow
export COLOR_13="#1AE1DC"           # Bright Blue (Folder)
export COLOR_14="#9C6CD3"           # Bright Magenta
export COLOR_15="#4B8F77"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2A3B4D"   # Background
export FOREGROUND_COLOR="#9FA2A6"   # Foreground (Text)

export CURSOR_COLOR="#9FA2A6" # Cursor

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
