#!/usr/bin/env bash

export PROFILE_NAME="Digital Rain"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#C85A46"           # Red (Syntax string)
export COLOR_03="#64C83C"           # Green (Command)
export COLOR_04="#A67A50"           # Yellow (Command second)
export COLOR_05="#5482AF"           # Blue (Path)
export COLOR_06="#9472B4"           # Magenta (Syntax var)
export COLOR_07="#468C78"           # Cyan (Prompt)
export COLOR_08="#00FF00"           # White

export COLOR_09="#7C8D7C"           # Bright Black
export COLOR_10="#C85A46"           # Bright Red (Command error)
export COLOR_11="#64C83C"           # Bright Green (Exec)
export COLOR_12="#A67A50"           # Bright Yellow
export COLOR_13="#5482AF"           # Bright Blue (Folder)
export COLOR_14="#9472B4"           # Bright Magenta
export COLOR_15="#468C78"           # Bright Cyan
export COLOR_16="#D8E2DC"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#00FF00"   # Foreground (Text)

export CURSOR_COLOR="#00FF00" # Cursor

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
