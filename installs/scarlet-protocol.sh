#!/usr/bin/env bash

export PROFILE_NAME="Scarlet Protocol"

export COLOR_01="#101116"           # Black (Host)
export COLOR_02="#FF0051"           # Red (Syntax string)
export COLOR_03="#00DC84"           # Green (Command)
export COLOR_04="#FAF945"           # Yellow (Command second)
export COLOR_05="#0271B6"           # Blue (Path)
export COLOR_06="#CA30C7"           # Magenta (Syntax var)
export COLOR_07="#00C5C7"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#FF6E67"           # Bright Red (Command error)
export COLOR_11="#5FFA68"           # Bright Green (Exec)
export COLOR_12="#FFFC67"           # Bright Yellow
export COLOR_13="#6871FF"           # Bright Blue (Folder)
export COLOR_14="#BD35EC"           # Bright Magenta
export COLOR_15="#60FDFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1C153D"   # Background
export FOREGROUND_COLOR="#E41951"   # Foreground (Text)

export CURSOR_COLOR="#76FF9F" # Cursor

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
