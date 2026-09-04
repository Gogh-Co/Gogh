#!/usr/bin/env bash

export PROFILE_NAME="Purpurite"

export COLOR_01="#1F2533"           # Black (Host)
export COLOR_02="#FF6666"           # Red (Syntax string)
export COLOR_03="#99FF99"           # Green (Command)
export COLOR_04="#FF9966"           # Yellow (Command second)
export COLOR_05="#99BBFF"           # Blue (Path)
export COLOR_06="#FF99DD"           # Magenta (Syntax var)
export COLOR_07="#99DDFF"           # Cyan (Prompt)
export COLOR_08="#CCDDFF"           # White

export COLOR_09="#3D4B66"           # Bright Black
export COLOR_10="#FF9999"           # Bright Red (Command error)
export COLOR_11="#99FFDD"           # Bright Green (Exec)
export COLOR_12="#FFCC66"           # Bright Yellow
export COLOR_13="#CCDDFF"           # Bright Blue (Folder)
export COLOR_14="#9999FF"           # Bright Magenta
export COLOR_15="#CCEEFF"           # Bright Cyan
export COLOR_16="#99FFDD"           # Bright White

export BACKGROUND_COLOR="#1F2533"   # Background
export FOREGROUND_COLOR="#CCDDFF"   # Foreground (Text)

export CURSOR_COLOR="#CCDDFF" # Cursor

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
