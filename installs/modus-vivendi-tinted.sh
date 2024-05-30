#!/usr/bin/env bash

export PROFILE_NAME="Modus Vivendi Tinted"

export COLOR_01="#0d0e1c"           # Black (Host)
export COLOR_02="#ff5f59"           # Red (Syntax string)
export COLOR_03="#44bc44"           # Green (Command)
export COLOR_04="#d0bc00"           # Yellow (Command second)
export COLOR_05="#2fafff"           # Blue (Path)
export COLOR_06="#feacd0"           # Magenta (Syntax var)
export COLOR_07="#00d3d0"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#1d2235"           # Bright Black
export COLOR_10="#ff5f5f"           # Bright Red (Command error)
export COLOR_11="#44df44"           # Bright Green (Exec)
export COLOR_12="#efef00"           # Bright Yellow
export COLOR_13="#338fff"           # Bright Blue (Folder)
export COLOR_14="#ff66ff"           # Bright Magenta
export COLOR_15="#00eff0"           # Bright Cyan
export COLOR_16="#989898"           # Bright White

export BACKGROUND_COLOR="#0d0e1c"   # Background
export FOREGROUND_COLOR="#ffffff"   # Foreground (Text)

export CURSOR_COLOR="#ffffff" # Cursor

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
