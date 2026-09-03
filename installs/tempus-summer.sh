#!/usr/bin/env bash

export PROFILE_NAME="Tempus Summer"

export COLOR_01="#202C3D"           # Black (Host)
export COLOR_02="#FE6F70"           # Red (Syntax string)
export COLOR_03="#4EB075"           # Green (Command)
export COLOR_04="#BA9A0A"           # Yellow (Command second)
export COLOR_05="#60A1E6"           # Blue (Path)
export COLOR_06="#D285AD"           # Magenta (Syntax var)
export COLOR_07="#3DAE9F"           # Cyan (Prompt)
export COLOR_08="#949CBF"           # White

export COLOR_09="#39304F"           # Bright Black
export COLOR_10="#EC7F4F"           # Bright Red (Command error)
export COLOR_11="#5BAF4F"           # Bright Green (Exec)
export COLOR_12="#BE981F"           # Bright Yellow
export COLOR_13="#8599EF"           # Bright Blue (Folder)
export COLOR_14="#CC82D7"           # Bright Magenta
export COLOR_15="#2AACBF"           # Bright Cyan
export COLOR_16="#A0ABAE"           # Bright White

export BACKGROUND_COLOR="#202C3D"   # Background
export FOREGROUND_COLOR="#A0ABAE"   # Foreground (Text)

export CURSOR_COLOR="#A0ABAE" # Cursor

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
