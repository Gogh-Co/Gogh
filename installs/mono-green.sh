#!/usr/bin/env bash

export PROFILE_NAME="Mono Green"

export COLOR_01="#034000"           # Black (Host)
export COLOR_02="#0BFF00"           # Red (Syntax string)
export COLOR_03="#0BFF00"           # Green (Command)
export COLOR_04="#0BFF00"           # Yellow (Command second)
export COLOR_05="#0BFF00"           # Blue (Path)
export COLOR_06="#0BFF00"           # Magenta (Syntax var)
export COLOR_07="#0BFF00"           # Cyan (Prompt)
export COLOR_08="#0BFF00"           # White

export COLOR_09="#0BFF00"           # Bright Black
export COLOR_10="#0BFF00"           # Bright Red (Command error)
export COLOR_11="#0BFF00"           # Bright Green (Exec)
export COLOR_12="#0BFF00"           # Bright Yellow
export COLOR_13="#0BFF00"           # Bright Blue (Folder)
export COLOR_14="#0BFF00"           # Bright Magenta
export COLOR_15="#0BFF00"           # Bright Cyan
export COLOR_16="#0BFF00"           # Bright White

export BACKGROUND_COLOR="#022B00"   # Background
export FOREGROUND_COLOR="#0BFF00"   # Foreground (Text)

export CURSOR_COLOR="#0BFF00" # Cursor

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
