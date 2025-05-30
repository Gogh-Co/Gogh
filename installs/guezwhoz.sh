#!/usr/bin/env bash

export PROFILE_NAME="Guezwhoz"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#E85181"           # Red (Syntax string)
export COLOR_03="#7AD694"           # Green (Command)
export COLOR_04="#B7D074"           # Yellow (Command second)
export COLOR_05="#5AA0D6"           # Blue (Path)
export COLOR_06="#9A90E0"           # Magenta (Syntax var)
export COLOR_07="#58D6CE"           # Cyan (Prompt)
export COLOR_08="#D9D9D9"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#e85181"           # Bright Red (Command error)
export COLOR_11="#AFD7AF"           # Bright Green (Exec)
export COLOR_12="#d1ed85"           # Bright Yellow
export COLOR_13="#64B2ED"           # Bright Blue (Folder)
export COLOR_14="#A398ED"           # Bright Magenta
export COLOR_15="#61EDE4"           # Bright Cyan
export COLOR_16="#EDEDED"           # Bright White

export BACKGROUND_COLOR="#1d1d1d"   # Background
export FOREGROUND_COLOR="#d9d9d9"   # Foreground (Text)

export CURSOR_COLOR="#99d4b1" # Cursor

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
