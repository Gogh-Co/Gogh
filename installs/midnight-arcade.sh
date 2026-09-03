#!/usr/bin/env bash

export PROFILE_NAME="Midnight Arcade"

export COLOR_01="#3F4550"           # Black (Host)
export COLOR_02="#FB7185"           # Red (Syntax string)
export COLOR_03="#22C55E"           # Green (Command)
export COLOR_04="#FBBF24"           # Yellow (Command second)
export COLOR_05="#60A5FA"           # Blue (Path)
export COLOR_06="#E879F9"           # Magenta (Syntax var)
export COLOR_07="#22D3EE"           # Cyan (Prompt)
export COLOR_08="#B6C2D5"           # White

export COLOR_09="#3D4452"           # Bright Black
export COLOR_10="#FC8D9D"           # Bright Red (Command error)
export COLOR_11="#4ED17E"           # Bright Green (Exec)
export COLOR_12="#FCCB4B"           # Bright Yellow
export COLOR_13="#80B7FB"           # Bright Blue (Folder)
export COLOR_14="#ED94FA"           # Bright Magenta
export COLOR_15="#4EDCF1"           # Bright Cyan
export COLOR_16="#F8FAFC"           # Bright White

export BACKGROUND_COLOR="#0B1220"   # Background
export FOREGROUND_COLOR="#F8FAFC"   # Foreground (Text)

export CURSOR_COLOR="#F8FAFC" # Cursor

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
