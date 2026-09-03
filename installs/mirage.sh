#!/usr/bin/env bash

export PROFILE_NAME="Mirage"

export COLOR_01="#011627"           # Black (Host)
export COLOR_02="#FF9999"           # Red (Syntax string)
export COLOR_03="#85CC95"           # Green (Command)
export COLOR_04="#FFD700"           # Yellow (Command second)
export COLOR_05="#7FB5FF"           # Blue (Path)
export COLOR_06="#DDB3FF"           # Magenta (Syntax var)
export COLOR_07="#21C7A8"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#575656"           # Bright Black
export COLOR_10="#FF9999"           # Bright Red (Command error)
export COLOR_11="#85CC95"           # Bright Green (Exec)
export COLOR_12="#FFD700"           # Bright Yellow
export COLOR_13="#7FB5FF"           # Bright Blue (Folder)
export COLOR_14="#DDB3FF"           # Bright Magenta
export COLOR_15="#85CC95"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1B2738"   # Background
export FOREGROUND_COLOR="#A6B2C0"   # Foreground (Text)

export CURSOR_COLOR="#DDB3FF" # Cursor

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
