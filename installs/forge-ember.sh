#!/usr/bin/env bash

export PROFILE_NAME="Forge Ember"

export COLOR_01="#241810"           # Black (Host)
export COLOR_02="#FF4733"           # Red (Syntax string)
export COLOR_03="#C4C24A"           # Green (Command)
export COLOR_04="#FFB347"           # Yellow (Command second)
export COLOR_05="#F0A24F"           # Blue (Path)
export COLOR_06="#FF6A4D"           # Magenta (Syntax var)
export COLOR_07="#FFD27A"           # Cyan (Prompt)
export COLOR_08="#E6D2B6"           # White

export COLOR_09="#7A6248"           # Bright Black
export COLOR_10="#FF4733"           # Bright Red (Command error)
export COLOR_11="#C4C24A"           # Bright Green (Exec)
export COLOR_12="#FF7A2D"           # Bright Yellow
export COLOR_13="#F0A24F"           # Bright Blue (Folder)
export COLOR_14="#FF6A4D"           # Bright Magenta
export COLOR_15="#FFD27A"           # Bright Cyan
export COLOR_16="#F4E2C8"           # Bright White

export BACKGROUND_COLOR="#140C07"   # Background
export FOREGROUND_COLOR="#F4E2C8"   # Foreground (Text)

export CURSOR_COLOR="#FF6A1F" # Cursor

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
