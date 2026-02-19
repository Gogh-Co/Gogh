#!/usr/bin/env bash

export PROFILE_NAME="Tomorrow"

export COLOR_01="#E0E0E0"           # Black (Host)
export COLOR_02="#C82829"           # Red (Syntax string)
export COLOR_03="#718C00"           # Green (Command)
export COLOR_04="#EAB700"           # Yellow (Command second)
export COLOR_05="#4271AE"           # Blue (Path)
export COLOR_06="#8959A8"           # Magenta (Syntax var)
export COLOR_07="#3E999F"           # Cyan (Prompt)
export COLOR_08="#4D4D4C"           # White

export COLOR_09="#8E908C"           # Bright Black
export COLOR_10="#C82829"           # Bright Red (Command error)
export COLOR_11="#718C00"           # Bright Green (Exec)
export COLOR_12="#EAB700"           # Bright Yellow
export COLOR_13="#4271AE"           # Bright Blue (Folder)
export COLOR_14="#8959A8"           # Bright Magenta
export COLOR_15="#3E999F"           # Bright Cyan
export COLOR_16="#1D1F21"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#4D4D4C"   # Foreground (Text)

export CURSOR_COLOR="#4D4D4C" # Cursor

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
