#!/usr/bin/env bash

export PROFILE_NAME="Treehouse"

export COLOR_01="#321300"           # Black (Host)
export COLOR_02="#B2270E"           # Red (Syntax string)
export COLOR_03="#44A900"           # Green (Command)
export COLOR_04="#AA820C"           # Yellow (Command second)
export COLOR_05="#58859A"           # Blue (Path)
export COLOR_06="#97363D"           # Magenta (Syntax var)
export COLOR_07="#B25A1E"           # Cyan (Prompt)
export COLOR_08="#786B53"           # White

export COLOR_09="#433626"           # Bright Black
export COLOR_10="#ED5D20"           # Bright Red (Command error)
export COLOR_11="#55F238"           # Bright Green (Exec)
export COLOR_12="#F2B732"           # Bright Yellow
export COLOR_13="#85CFED"           # Bright Blue (Folder)
export COLOR_14="#E14C5A"           # Bright Magenta
export COLOR_15="#F07D14"           # Bright Cyan
export COLOR_16="#FFC800"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#786B53"   # Foreground (Text)

export CURSOR_COLOR="#786B53" # Cursor

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
