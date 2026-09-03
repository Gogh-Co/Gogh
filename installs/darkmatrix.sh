#!/usr/bin/env bash

export PROFILE_NAME="Darkmatrix"

export COLOR_01="#091013"           # Black (Host)
export COLOR_02="#006536"           # Red (Syntax string)
export COLOR_03="#6FA64C"           # Green (Command)
export COLOR_04="#7E8000"           # Yellow (Command second)
export COLOR_05="#2C9A84"           # Blue (Path)
export COLOR_06="#452D53"           # Magenta (Syntax var)
export COLOR_07="#114D53"           # Cyan (Prompt)
export COLOR_08="#006536"           # White

export COLOR_09="#333333"           # Bright Black
export COLOR_10="#00733D"           # Bright Red (Command error)
export COLOR_11="#90D762"           # Bright Green (Exec)
export COLOR_12="#E2E500"           # Bright Yellow
export COLOR_13="#46D8B8"           # Bright Blue (Folder)
export COLOR_14="#4A3059"           # Bright Magenta
export COLOR_15="#12545A"           # Bright Cyan
export COLOR_16="#006536"           # Bright White

export BACKGROUND_COLOR="#070C0E"   # Background
export FOREGROUND_COLOR="#3E5715"   # Foreground (Text)

export CURSOR_COLOR="#9FA86E" # Cursor

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
