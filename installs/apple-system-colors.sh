#!/usr/bin/env bash

export PROFILE_NAME="Apple System Colors"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#CC372E"           # Red (Syntax string)
export COLOR_03="#26A439"           # Green (Command)
export COLOR_04="#CDAC08"           # Yellow (Command second)
export COLOR_05="#0869CB"           # Blue (Path)
export COLOR_06="#9647BF"           # Magenta (Syntax var)
export COLOR_07="#479EC2"           # Cyan (Prompt)
export COLOR_08="#98989D"           # White

export COLOR_09="#464646"           # Bright Black
export COLOR_10="#FF453A"           # Bright Red (Command error)
export COLOR_11="#32D74B"           # Bright Green (Exec)
export COLOR_12="#FFD60A"           # Bright Yellow
export COLOR_13="#0A84FF"           # Bright Blue (Folder)
export COLOR_14="#BF5AF2"           # Bright Magenta
export COLOR_15="#76D6FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#98989D" # Cursor

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
