#!/usr/bin/env bash

export PROFILE_NAME="Fairy Floss"

export COLOR_01="#42395D"           # Black (Host)
export COLOR_02="#A8757B"           # Red (Syntax string)
export COLOR_03="#FF857F"           # Green (Command)
export COLOR_04="#E6C000"           # Yellow (Command second)
export COLOR_05="#AE81FF"           # Blue (Path)
export COLOR_06="#716799"           # Magenta (Syntax var)
export COLOR_07="#C2FFDF"           # Cyan (Prompt)
export COLOR_08="#F8F8F2"           # White

export COLOR_09="#75507B"           # Bright Black
export COLOR_10="#FFB8D1"           # Bright Red (Command error)
export COLOR_11="#F1568E"           # Bright Green (Exec)
export COLOR_12="#D5A425"           # Bright Yellow
export COLOR_13="#C5A3FF"           # Bright Blue (Folder)
export COLOR_14="#8077A8"           # Bright Magenta
export COLOR_15="#C2FFFF"           # Bright Cyan
export COLOR_16="#F8F8F0"           # Bright White

export BACKGROUND_COLOR="#5A5475"   # Background
export FOREGROUND_COLOR="#C2FFDF"   # Foreground (Text)

export CURSOR_COLOR="#FFB8D1" # Cursor

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
