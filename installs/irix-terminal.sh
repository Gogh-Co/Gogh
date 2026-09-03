#!/usr/bin/env bash

export PROFILE_NAME="IRIX Terminal"

export COLOR_01="#1A1919"           # Black (Host)
export COLOR_02="#FF2B1E"           # Red (Syntax string)
export COLOR_03="#57FF3D"           # Green (Command)
export COLOR_04="#FFFF44"           # Yellow (Command second)
export COLOR_05="#0004FF"           # Blue (Path)
export COLOR_06="#FF2CFF"           # Magenta (Syntax var)
export COLOR_07="#56FFFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#FFFF44"           # Bright Black
export COLOR_10="#FFFF44"           # Bright Red (Command error)
export COLOR_11="#FFFF44"           # Bright Green (Exec)
export COLOR_12="#FFFC72"           # Bright Yellow
export COLOR_13="#FFFF44"           # Bright Blue (Folder)
export COLOR_14="#FFFF44"           # Bright Magenta
export COLOR_15="#FFFF44"           # Bright Cyan
export COLOR_16="#FFFF44"           # Bright White

export BACKGROUND_COLOR="#000043"   # Background
export FOREGROUND_COLOR="#F2F2F2"   # Foreground (Text)

export CURSOR_COLOR="#C7C7C7" # Cursor

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
