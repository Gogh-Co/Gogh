#!/usr/bin/env bash

export PROFILE_NAME="Leaf Dark"

export COLOR_01="#2E2C2F"           # Black (Host)
export COLOR_02="#BA5860"           # Red (Syntax string)
export COLOR_03="#729B79"           # Green (Command)
export COLOR_04="#CCAA6C"           # Yellow (Command second)
export COLOR_05="#5292C6"           # Blue (Path)
export COLOR_06="#8C6AA8"           # Magenta (Syntax var)
export COLOR_07="#489CA5"           # Cyan (Prompt)
export COLOR_08="#E1E4DC"           # White

export COLOR_09="#403F42"           # Bright Black
export COLOR_10="#D6797A"           # Bright Red (Command error)
export COLOR_11="#98CCA4"           # Bright Green (Exec)
export COLOR_12="#E3C882"           # Bright Yellow
export COLOR_13="#76ACE6"           # Bright Blue (Folder)
export COLOR_14="#B798E6"           # Bright Magenta
export COLOR_15="#77C5DA"           # Bright Cyan
export COLOR_16="#FCFFF6"           # Bright White

export BACKGROUND_COLOR="#2E2C2F"   # Background
export FOREGROUND_COLOR="#E1E4DC"   # Foreground (Text)

export CURSOR_COLOR="#E1E4DC" # Cursor

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
