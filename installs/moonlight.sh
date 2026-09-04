#!/usr/bin/env bash

export PROFILE_NAME="Moonlight"

export COLOR_01="#212337"           # Black (Host)
export COLOR_02="#FF5370"           # Red (Syntax string)
export COLOR_03="#2DF4C0"           # Green (Command)
export COLOR_04="#FFC777"           # Yellow (Command second)
export COLOR_05="#40FFFF"           # Blue (Path)
export COLOR_06="#B994F1"           # Magenta (Syntax var)
export COLOR_07="#04D1F9"           # Cyan (Prompt)
export COLOR_08="#A3ACE1"           # White

export COLOR_09="#748CD6"           # Bright Black
export COLOR_10="#FF5370"           # Bright Red (Command error)
export COLOR_11="#2DF4C0"           # Bright Green (Exec)
export COLOR_12="#FFC777"           # Bright Yellow
export COLOR_13="#40FFFF"           # Bright Blue (Folder)
export COLOR_14="#B994F1"           # Bright Magenta
export COLOR_15="#04D1F9"           # Bright Cyan
export COLOR_16="#EF43FA"           # Bright White

export BACKGROUND_COLOR="#212337"   # Background
export FOREGROUND_COLOR="#A3ACE1"   # Foreground (Text)

export CURSOR_COLOR="#A3ACE1" # Cursor

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
