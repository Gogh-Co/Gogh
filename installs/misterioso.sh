#!/usr/bin/env bash

export PROFILE_NAME="Misterioso"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF4242"           # Red (Syntax string)
export COLOR_03="#74AF68"           # Green (Command)
export COLOR_04="#FFAD29"           # Yellow (Command second)
export COLOR_05="#338F86"           # Blue (Path)
export COLOR_06="#9414E6"           # Magenta (Syntax var)
export COLOR_07="#23D7D7"           # Cyan (Prompt)
export COLOR_08="#E1E1E0"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#FF3242"           # Bright Red (Command error)
export COLOR_11="#74CD68"           # Bright Green (Exec)
export COLOR_12="#FFB929"           # Bright Yellow
export COLOR_13="#23D7D7"           # Bright Blue (Folder)
export COLOR_14="#FF37FF"           # Bright Magenta
export COLOR_15="#00EDE1"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2D3743"   # Background
export FOREGROUND_COLOR="#E1E1E0"   # Foreground (Text)

export CURSOR_COLOR="#E1E1E0" # Cursor

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
