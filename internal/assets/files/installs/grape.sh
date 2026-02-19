#!/usr/bin/env bash

export PROFILE_NAME="Grape"

export COLOR_01="#2D283F"           # Black (Host)
export COLOR_02="#ED2261"           # Red (Syntax string)
export COLOR_03="#1FA91B"           # Green (Command)
export COLOR_04="#8DDC20"           # Yellow (Command second)
export COLOR_05="#487DF4"           # Blue (Path)
export COLOR_06="#8D35C9"           # Magenta (Syntax var)
export COLOR_07="#3BDEED"           # Cyan (Prompt)
export COLOR_08="#9E9EA0"           # White

export COLOR_09="#59516A"           # Bright Black
export COLOR_10="#F0729A"           # Bright Red (Command error)
export COLOR_11="#53AA5E"           # Bright Green (Exec)
export COLOR_12="#B2DC87"           # Bright Yellow
export COLOR_13="#A9BCEC"           # Bright Blue (Folder)
export COLOR_14="#AD81C2"           # Bright Magenta
export COLOR_15="#9DE3EB"           # Bright Cyan
export COLOR_16="#A288F7"           # Bright White

export BACKGROUND_COLOR="#171423"   # Background
export FOREGROUND_COLOR="#9F9FA1"   # Foreground (Text)

export CURSOR_COLOR="#9F9FA1" # Cursor

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
