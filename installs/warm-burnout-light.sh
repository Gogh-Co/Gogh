#!/usr/bin/env bash

export PROFILE_NAME="Warm Burnout Light"

export COLOR_01="#3A3630"           # Black (Host)
export COLOR_02="#B82820"           # Red (Syntax string)
export COLOR_03="#2D6A14"           # Green (Command)
export COLOR_04="#8A6000"           # Yellow (Command second)
export COLOR_05="#2060A0"           # Blue (Path)
export COLOR_06="#8A3090"           # Magenta (Syntax var)
export COLOR_07="#146858"           # Cyan (Prompt)
export COLOR_08="#C0B8AA"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#C83028"           # Bright Red (Command error)
export COLOR_11="#3A7A20"           # Bright Green (Exec)
export COLOR_12="#9A7008"           # Bright Yellow
export COLOR_13="#2870B0"           # Bright Blue (Folder)
export COLOR_14="#9A38A0"           # Bright Magenta
export COLOR_15="#208870"           # Bright Cyan
export COLOR_16="#FAF6F0"           # Bright White

export BACKGROUND_COLOR="#F5EDE0"   # Background
export FOREGROUND_COLOR="#3A3630"   # Foreground (Text)

export CURSOR_COLOR="#8A6600" # Cursor

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
