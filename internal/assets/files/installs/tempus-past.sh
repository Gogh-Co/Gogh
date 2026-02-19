#!/usr/bin/env bash

export PROFILE_NAME="Tempus Past"

export COLOR_01="#53545b"           # Black (Host)
export COLOR_02="#c00c50"           # Red (Syntax string)
export COLOR_03="#0a7040"           # Green (Command)
export COLOR_04="#a6403a"           # Yellow (Command second)
export COLOR_05="#1763aa"           # Blue (Path)
export COLOR_06="#b02874"           # Magenta (Syntax var)
export COLOR_07="#096a83"           # Cyan (Prompt)
export COLOR_08="#eae2de"           # White

export COLOR_09="#80565d"           # Bright Black
export COLOR_10="#bd3133"           # Bright Red (Command error)
export COLOR_11="#337243"           # Bright Green (Exec)
export COLOR_12="#8d554a"           # Bright Yellow
export COLOR_13="#5559bb"           # Bright Blue (Folder)
export COLOR_14="#b022a7"           # Bright Magenta
export COLOR_15="#07707a"           # Bright Cyan
export COLOR_16="#f3f2f4"           # Bright White

export BACKGROUND_COLOR="#f3f2f4"   # Background
export FOREGROUND_COLOR="#53545b"   # Foreground (Text)

export CURSOR_COLOR="#53545b" # Cursor

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
