#!/usr/bin/env bash

export PROFILE_NAME="Amber CRT Retro"

export COLOR_01="#2A1E00"           # Black (Host)
export COLOR_02="#FF6A00"           # Red (Syntax string)
export COLOR_03="#FFB000"           # Green (Command)
export COLOR_04="#FFC742"           # Yellow (Command second)
export COLOR_05="#FF8C00"           # Blue (Path)
export COLOR_06="#FFA033"           # Magenta (Syntax var)
export COLOR_07="#FFD27F"           # Cyan (Prompt)
export COLOR_08="#FFD9A0"           # White

export COLOR_09="#6A4E00"           # Bright Black
export COLOR_10="#FF8A1E"           # Bright Red (Command error)
export COLOR_11="#FFC742"           # Bright Green (Exec)
export COLOR_12="#FFE08A"           # Bright Yellow
export COLOR_13="#FFAB3D"           # Bright Blue (Folder)
export COLOR_14="#FFC266"           # Bright Magenta
export COLOR_15="#FFE3B0"           # Bright Cyan
export COLOR_16="#FFF0D6"           # Bright White

export BACKGROUND_COLOR="#1A1200"   # Background
export FOREGROUND_COLOR="#FFB000"   # Foreground (Text)

export CURSOR_COLOR="#FFB000" # Cursor

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
