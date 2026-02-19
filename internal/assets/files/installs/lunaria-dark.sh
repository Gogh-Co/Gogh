#!/usr/bin/env bash

export PROFILE_NAME="Lunaria Dark"

export COLOR_01="#36464E"           # Black (Host)
export COLOR_02="#846560"           # Red (Syntax string)
export COLOR_03="#809984"           # Green (Command)
export COLOR_04="#A79A79"           # Yellow (Command second)
export COLOR_05="#555673"           # Blue (Path)
export COLOR_06="#866C83"           # Magenta (Syntax var)
export COLOR_07="#7E98B4"           # Cyan (Prompt)
export COLOR_08="#CACED8"           # White

export COLOR_09="#404F56"           # Bright Black
export COLOR_10="#BB928B"           # Bright Red (Command error)
export COLOR_11="#BFDCC2"           # Bright Green (Exec)
export COLOR_12="#F1DFB6"           # Bright Yellow
export COLOR_13="#777798"           # Bright Blue (Folder)
export COLOR_14="#BF9DB9"           # Bright Magenta
export COLOR_15="#BDDCFF"           # Bright Cyan
export COLOR_16="#DFE2ED"           # Bright White

export BACKGROUND_COLOR="#36464E"   # Background
export FOREGROUND_COLOR="#CACED8"   # Foreground (Text)

export CURSOR_COLOR="#CACED8" # Cursor

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
