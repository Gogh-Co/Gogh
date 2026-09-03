#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Abyss"

export COLOR_01="#030308"           # Black (Host)
export COLOR_02="#D26060"           # Red (Syntax string)
export COLOR_03="#60D286"           # Green (Command)
export COLOR_04="#D2BF60"           # Yellow (Command second)
export COLOR_05="#6090D2"           # Blue (Path)
export COLOR_06="#D260D2"           # Magenta (Syntax var)
export COLOR_07="#60D2D2"           # Cyan (Prompt)
export COLOR_08="#F1F1F8"           # White

export COLOR_09="#3D3D70"           # Bright Black
export COLOR_10="#E39C9C"           # Bright Red (Command error)
export COLOR_11="#9CE3B3"           # Bright Green (Exec)
export COLOR_12="#E3D79C"           # Bright Yellow
export COLOR_13="#9CB9E3"           # Bright Blue (Folder)
export COLOR_14="#E39CE3"           # Bright Magenta
export COLOR_15="#9CE3E3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#050510"   # Background
export FOREGROUND_COLOR="#E0E0F0"   # Foreground (Text)

export CURSOR_COLOR="#6E56CF" # Cursor

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
