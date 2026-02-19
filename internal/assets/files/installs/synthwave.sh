#!/usr/bin/env bash

export PROFILE_NAME="Synthwave"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#FE4450"           # Red (Syntax string)
export COLOR_03="#72F1B8"           # Green (Command)
export COLOR_04="#FEDE5D"           # Yellow (Command second)
export COLOR_05="#03EDF9"           # Blue (Path)
export COLOR_06="#FF7EDB"           # Magenta (Syntax var)
export COLOR_07="#03EDF9"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#FE4450"           # Bright Red (Command error)
export COLOR_11="#72F1B8"           # Bright Green (Exec)
export COLOR_12="#FEDE5D"           # Bright Yellow
export COLOR_13="#03EDF9"           # Bright Blue (Folder)
export COLOR_14="#FF7EDB"           # Bright Magenta
export COLOR_15="#03EDF9"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#262335"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#03EDF9" # Cursor

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
