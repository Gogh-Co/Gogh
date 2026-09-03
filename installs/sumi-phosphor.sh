#!/usr/bin/env bash

export PROFILE_NAME="Sumi Phosphor"

export COLOR_01="#1E1A16"           # Black (Host)
export COLOR_02="#D45848"           # Red (Syntax string)
export COLOR_03="#5CA868"           # Green (Command)
export COLOR_04="#D4A03C"           # Yellow (Command second)
export COLOR_05="#5A82B8"           # Blue (Path)
export COLOR_06="#9870B0"           # Magenta (Syntax var)
export COLOR_07="#2EC4B6"           # Cyan (Prompt)
export COLOR_08="#8A8478"           # White

export COLOR_09="#474139"           # Bright Black
export COLOR_10="#E87060"           # Bright Red (Command error)
export COLOR_11="#72C078"           # Bright Green (Exec)
export COLOR_12="#E8B84C"           # Bright Yellow
export COLOR_13="#70A0D8"           # Bright Blue (Folder)
export COLOR_14="#B088C8"           # Bright Magenta
export COLOR_15="#48D8C8"           # Bright Cyan
export COLOR_16="#E0DCD4"           # Bright White

export BACKGROUND_COLOR="#12100E"   # Background
export FOREGROUND_COLOR="#BAB4A8"   # Foreground (Text)

export CURSOR_COLOR="#2EC4B6" # Cursor

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
