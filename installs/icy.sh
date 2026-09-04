#!/usr/bin/env bash

export PROFILE_NAME="Icy"

export COLOR_01="#021012"           # Black (Host)
export COLOR_02="#16C1D9"           # Red (Syntax string)
export COLOR_03="#4DD0E1"           # Green (Command)
export COLOR_04="#80DEEA"           # Yellow (Command second)
export COLOR_05="#00BCD4"           # Blue (Path)
export COLOR_06="#00ACC1"           # Magenta (Syntax var)
export COLOR_07="#26C6DA"           # Cyan (Prompt)
export COLOR_08="#095B67"           # White

export COLOR_09="#052E34"           # Bright Black
export COLOR_10="#16C1D9"           # Bright Red (Command error)
export COLOR_11="#4DD0E1"           # Bright Green (Exec)
export COLOR_12="#80DEEA"           # Bright Yellow
export COLOR_13="#00BCD4"           # Bright Blue (Folder)
export COLOR_14="#00ACC1"           # Bright Magenta
export COLOR_15="#26C6DA"           # Bright Cyan
export COLOR_16="#109CB0"           # Bright White

export BACKGROUND_COLOR="#021012"   # Background
export FOREGROUND_COLOR="#095B67"   # Foreground (Text)

export CURSOR_COLOR="#095B67" # Cursor

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
