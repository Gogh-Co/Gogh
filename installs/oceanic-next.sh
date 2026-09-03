#!/usr/bin/env bash

export PROFILE_NAME="Oceanic Next"

export COLOR_01="#1B2B34"           # Black (Host)
export COLOR_02="#DB686B"           # Red (Syntax string)
export COLOR_03="#A2C699"           # Green (Command)
export COLOR_04="#F2CA73"           # Yellow (Command second)
export COLOR_05="#7198C8"           # Blue (Path)
export COLOR_06="#BD96C2"           # Magenta (Syntax var)
export COLOR_07="#74B1B2"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#68737D"           # Bright Black
export COLOR_10="#DB686B"           # Bright Red (Command error)
export COLOR_11="#A2C699"           # Bright Green (Exec)
export COLOR_12="#F2CA73"           # Bright Yellow
export COLOR_13="#7198C8"           # Bright Blue (Folder)
export COLOR_14="#BD96C2"           # Bright Magenta
export COLOR_15="#74B1B2"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1B2B34"   # Background
export FOREGROUND_COLOR="#C1C5CD"   # Foreground (Text)

export CURSOR_COLOR="#C1C5CD" # Cursor

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
