#!/usr/bin/env bash

export PROFILE_NAME="Alien Blood"

export COLOR_01="#112616"           # Black (Host)
export COLOR_02="#7F2B27"           # Red (Syntax string)
export COLOR_03="#2F7E25"           # Green (Command)
export COLOR_04="#717F24"           # Yellow (Command second)
export COLOR_05="#2F6A7F"           # Blue (Path)
export COLOR_06="#47587F"           # Magenta (Syntax var)
export COLOR_07="#327F77"           # Cyan (Prompt)
export COLOR_08="#647D75"           # White

export COLOR_09="#3C4812"           # Bright Black
export COLOR_10="#E08009"           # Bright Red (Command error)
export COLOR_11="#18E000"           # Bright Green (Exec)
export COLOR_12="#BDE000"           # Bright Yellow
export COLOR_13="#00AAE0"           # Bright Blue (Folder)
export COLOR_14="#0058E0"           # Bright Magenta
export COLOR_15="#00E0C4"           # Bright Cyan
export COLOR_16="#73FA91"           # Bright White

export BACKGROUND_COLOR="#0F1610"   # Background
export FOREGROUND_COLOR="#637D75"   # Foreground (Text)

export CURSOR_COLOR="#637D75" # Cursor

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
