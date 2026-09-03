#!/usr/bin/env bash

export PROFILE_NAME="Oxblood"

export COLOR_01="#231417"           # Black (Host)
export COLOR_02="#FF4D54"           # Red (Syntax string)
export COLOR_03="#C9A24A"           # Green (Command)
export COLOR_04="#E0B24A"           # Yellow (Command second)
export COLOR_05="#D9743F"           # Blue (Path)
export COLOR_06="#E0556B"           # Magenta (Syntax var)
export COLOR_07="#E0A36A"           # Cyan (Prompt)
export COLOR_08="#E8D2D4"           # White

export COLOR_09="#7A5458"           # Bright Black
export COLOR_10="#FF686E"           # Bright Red (Command error)
export COLOR_11="#CFAD60"           # Bright Green (Exec)
export COLOR_12="#D9743F"           # Bright Yellow
export COLOR_13="#E86B72"           # Bright Blue (Folder)
export COLOR_14="#C8324B"           # Bright Magenta
export COLOR_15="#E4AE7C"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#140B0D"   # Background
export FOREGROUND_COLOR="#E8D2D4"   # Foreground (Text)

export CURSOR_COLOR="#E0483A" # Cursor

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
