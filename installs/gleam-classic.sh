#!/usr/bin/env bash

export PROFILE_NAME="Gleam Classic"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F44747"           # Red (Syntax string)
export COLOR_03="#AADD8B"           # Green (Command)
export COLOR_04="#FFD596"           # Yellow (Command second)
export COLOR_05="#6796E6"           # Blue (Path)
export COLOR_06="#FE7AB2"           # Magenta (Syntax var)
export COLOR_07="#B181EC"           # Cyan (Prompt)
export COLOR_08="#F7F7F7"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#FF4A4A"           # Bright Red (Command error)
export COLOR_11="#C8FFA7"           # Bright Green (Exec)
export COLOR_12="#FDFFAB"           # Bright Yellow
export COLOR_13="#9CE7FF"           # Bright Blue (Folder)
export COLOR_14="#FFAFF3"           # Bright Magenta
export COLOR_15="#D9BAFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
