#!/usr/bin/env bash

export PROFILE_NAME="London Embankment Dusk"

export COLOR_01="#1C2533"           # Black (Host)
export COLOR_02="#C5573F"           # Red (Syntax string)
export COLOR_03="#6A8E85"           # Green (Command)
export COLOR_04="#E2BD5C"           # Yellow (Command second)
export COLOR_05="#5E87B3"           # Blue (Path)
export COLOR_06="#9B86A8"           # Magenta (Syntax var)
export COLOR_07="#82A8B8"           # Cyan (Prompt)
export COLOR_08="#E8EEF2"           # White

export COLOR_09="#4A566A"           # Bright Black
export COLOR_10="#E07050"           # Bright Red (Command error)
export COLOR_11="#88AAA3"           # Bright Green (Exec)
export COLOR_12="#F0CD6C"           # Bright Yellow
export COLOR_13="#82A4CC"           # Bright Blue (Folder)
export COLOR_14="#B09BC0"           # Bright Magenta
export COLOR_15="#A0C2D0"           # Bright Cyan
export COLOR_16="#FAFBFC"           # Bright White

export BACKGROUND_COLOR="#161F2C"   # Background
export FOREGROUND_COLOR="#E8EEF2"   # Foreground (Text)

export CURSOR_COLOR="#F2C455" # Cursor

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
