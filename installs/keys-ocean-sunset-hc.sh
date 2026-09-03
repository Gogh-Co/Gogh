#!/usr/bin/env bash

export PROFILE_NAME="Keys Ocean Sunset HC"

export COLOR_01="#7A92A8"           # Black (Host)
export COLOR_02="#FF6361"           # Red (Syntax string)
export COLOR_03="#4AD68A"           # Green (Command)
export COLOR_04="#FFA600"           # Yellow (Command second)
export COLOR_05="#6AA8F0"           # Blue (Path)
export COLOR_06="#DE72B0"           # Magenta (Syntax var)
export COLOR_07="#5EDEE8"           # Cyan (Prompt)
export COLOR_08="#C8D8EC"           # White

export COLOR_09="#8AA0B8"           # Bright Black
export COLOR_10="#FF8578"           # Bright Red (Command error)
export COLOR_11="#72F0A8"           # Bright Green (Exec)
export COLOR_12="#FFD380"           # Bright Yellow
export COLOR_13="#88C4FF"           # Bright Blue (Folder)
export COLOR_14="#F0A8D8"           # Bright Magenta
export COLOR_15="#88F0F8"           # Bright Cyan
export COLOR_16="#FFF5BE"           # Bright White

export BACKGROUND_COLOR="#060910"   # Background
export FOREGROUND_COLOR="#F0F4FA"   # Foreground (Text)

export CURSOR_COLOR="#FF8531" # Cursor

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
