#!/usr/bin/env bash

export PROFILE_NAME="Cupertino"

export COLOR_01="#FFFFFF"           # Black (Host)
export COLOR_02="#C41A15"           # Red (Syntax string)
export COLOR_03="#007400"           # Green (Command)
export COLOR_04="#826B28"           # Yellow (Command second)
export COLOR_05="#0000FF"           # Blue (Path)
export COLOR_06="#A90D91"           # Magenta (Syntax var)
export COLOR_07="#318495"           # Cyan (Prompt)
export COLOR_08="#404040"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#C41A15"           # Bright Red (Command error)
export COLOR_11="#007400"           # Bright Green (Exec)
export COLOR_12="#826B28"           # Bright Yellow
export COLOR_13="#0000FF"           # Bright Blue (Folder)
export COLOR_14="#A90D91"           # Bright Magenta
export COLOR_15="#318495"           # Bright Cyan
export COLOR_16="#5E5E5E"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#404040"   # Foreground (Text)

export CURSOR_COLOR="#404040" # Cursor

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
