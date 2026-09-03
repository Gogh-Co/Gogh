#!/usr/bin/env bash

export PROFILE_NAME="Darkermatrix"

export COLOR_01="#091013"           # Black (Host)
export COLOR_02="#002E18"           # Red (Syntax string)
export COLOR_03="#6FA64C"           # Green (Command)
export COLOR_04="#595900"           # Yellow (Command second)
export COLOR_05="#00CB6B"           # Blue (Path)
export COLOR_06="#412A4D"           # Magenta (Syntax var)
export COLOR_07="#125459"           # Cyan (Prompt)
export COLOR_08="#002E19"           # White

export COLOR_09="#333333"           # Bright Black
export COLOR_10="#00381D"           # Bright Red (Command error)
export COLOR_11="#90D762"           # Bright Green (Exec)
export COLOR_12="#E2E500"           # Bright Yellow
export COLOR_13="#00FF87"           # Bright Blue (Folder)
export COLOR_14="#412A4D"           # Bright Magenta
export COLOR_15="#176C73"           # Bright Cyan
export COLOR_16="#00381E"           # Bright White

export BACKGROUND_COLOR="#070C0E"   # Background
export FOREGROUND_COLOR="#28380D"   # Foreground (Text)

export CURSOR_COLOR="#373A26" # Cursor

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
