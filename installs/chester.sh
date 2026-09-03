#!/usr/bin/env bash

export PROFILE_NAME="Chester"

export COLOR_01="#080200"           # Black (Host)
export COLOR_02="#FA5E5B"           # Red (Syntax string)
export COLOR_03="#16C98D"           # Green (Command)
export COLOR_04="#FFC83F"           # Yellow (Command second)
export COLOR_05="#288AD6"           # Blue (Path)
export COLOR_06="#D34590"           # Magenta (Syntax var)
export COLOR_07="#28DDDE"           # Cyan (Prompt)
export COLOR_08="#E7E7E7"           # White

export COLOR_09="#6F6B68"           # Bright Black
export COLOR_10="#FA5E5B"           # Bright Red (Command error)
export COLOR_11="#16C98D"           # Bright Green (Exec)
export COLOR_12="#FEEF6D"           # Bright Yellow
export COLOR_13="#278AD6"           # Bright Blue (Folder)
export COLOR_14="#D34590"           # Bright Magenta
export COLOR_15="#27DEDE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2C3643"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#B4B1B1" # Cursor

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
