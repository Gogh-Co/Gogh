#!/usr/bin/env bash

export PROFILE_NAME="Pali"

export COLOR_01="#0A0A0A"           # Black (Host)
export COLOR_02="#AB8F74"           # Red (Syntax string)
export COLOR_03="#74AB8F"           # Green (Command)
export COLOR_04="#8FAB74"           # Yellow (Command second)
export COLOR_05="#8F74AB"           # Blue (Path)
export COLOR_06="#AB748F"           # Magenta (Syntax var)
export COLOR_07="#748FAB"           # Cyan (Prompt)
export COLOR_08="#F2F2F2"           # White

export COLOR_09="#5D5D5D"           # Bright Black
export COLOR_10="#FF1D62"           # Bright Red (Command error)
export COLOR_11="#9CC3AF"           # Bright Green (Exec)
export COLOR_12="#FFD00A"           # Bright Yellow
export COLOR_13="#AF9CC3"           # Bright Blue (Folder)
export COLOR_14="#FF1D62"           # Bright Magenta
export COLOR_15="#4BB8FD"           # Bright Cyan
export COLOR_16="#A020F0"           # Bright White

export BACKGROUND_COLOR="#232E37"   # Background
export FOREGROUND_COLOR="#D9E6F2"   # Foreground (Text)

export CURSOR_COLOR="#D9E6F2" # Cursor

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
