#!/usr/bin/env bash

export PROFILE_NAME="Konsolas"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#AA1717"           # Red (Syntax string)
export COLOR_03="#18B218"           # Green (Command)
export COLOR_04="#EBAE1F"           # Yellow (Command second)
export COLOR_05="#2323A5"           # Blue (Path)
export COLOR_06="#AD1EDC"           # Magenta (Syntax var)
export COLOR_07="#42B0C8"           # Cyan (Prompt)
export COLOR_08="#C8C1C1"           # White

export COLOR_09="#7B716E"           # Bright Black
export COLOR_10="#FF4141"           # Bright Red (Command error)
export COLOR_11="#5FFF5F"           # Bright Green (Exec)
export COLOR_12="#FFFF55"           # Bright Yellow
export COLOR_13="#4B4BFF"           # Bright Blue (Folder)
export COLOR_14="#FF54FF"           # Bright Magenta
export COLOR_15="#69FFFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#060606"   # Background
export FOREGROUND_COLOR="#C8C1C1"   # Foreground (Text)

export CURSOR_COLOR="#C8C1C1" # Cursor

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
