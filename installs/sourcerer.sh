#!/usr/bin/env bash

export PROFILE_NAME="Sourcerer"

export COLOR_01="#111111"           # Black (Host)
export COLOR_02="#AA4450"           # Red (Syntax string)
export COLOR_03="#719611"           # Green (Command)
export COLOR_04="#FF9800"           # Yellow (Command second)
export COLOR_05="#6688AA"           # Blue (Path)
export COLOR_06="#8F6F8F"           # Magenta (Syntax var)
export COLOR_07="#528B8B"           # Cyan (Prompt)
export COLOR_08="#D3D3D3"           # White

export COLOR_09="#181818"           # Bright Black
export COLOR_10="#FF6A6A"           # Bright Red (Command error)
export COLOR_11="#B1D631"           # Bright Green (Exec)
export COLOR_12="#87875F"           # Bright Yellow
export COLOR_13="#90B0D1"           # Bright Blue (Folder)
export COLOR_14="#8181A6"           # Bright Magenta
export COLOR_15="#87CEEB"           # Bright Cyan
export COLOR_16="#C1CDC1"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#C2C2B0"   # Foreground (Text)

export CURSOR_COLOR="#C2C2B0" # Cursor

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
