#!/usr/bin/env bash

export PROFILE_NAME="Summerfruit Dark"

export COLOR_01="#151515"           # Black (Host)
export COLOR_02="#FF0086"           # Red (Syntax string)
export COLOR_03="#00C918"           # Green (Command)
export COLOR_04="#ABA800"           # Yellow (Command second)
export COLOR_05="#3777E6"           # Blue (Path)
export COLOR_06="#AD00A1"           # Magenta (Syntax var)
export COLOR_07="#1FAAAA"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#FF0086"           # Bright Red (Command error)
export COLOR_11="#00C918"           # Bright Green (Exec)
export COLOR_12="#ABA800"           # Bright Yellow
export COLOR_13="#3777E6"           # Bright Blue (Folder)
export COLOR_14="#AD00A1"           # Bright Magenta
export COLOR_15="#1FAAAA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#151515"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
