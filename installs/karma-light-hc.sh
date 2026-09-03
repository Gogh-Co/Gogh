#!/usr/bin/env bash

export PROFILE_NAME="Karma Light HC"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C01650"           # Red (Syntax string)
export COLOR_03="#1A6E1C"           # Green (Command)
export COLOR_04="#9C6800"           # Yellow (Command second)
export COLOR_05="#2F5E9E"           # Blue (Path)
export COLOR_06="#4D2D9A"           # Magenta (Syntax var)
export COLOR_07="#2F5E9E"           # Cyan (Prompt)
export COLOR_08="#2E2C30"           # White

export COLOR_09="#999999"           # Bright Black
export COLOR_10="#C01650"           # Bright Red (Command error)
export COLOR_11="#1A6E1C"           # Bright Green (Exec)
export COLOR_12="#9C6800"           # Bright Yellow
export COLOR_13="#2F5E9E"           # Bright Blue (Folder)
export COLOR_14="#4D2D9A"           # Bright Magenta
export COLOR_15="#2F5E9E"           # Bright Cyan
export COLOR_16="#0A0E14"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#4D2D9A" # Cursor

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
