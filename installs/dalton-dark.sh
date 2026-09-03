#!/usr/bin/env bash

export PROFILE_NAME="Dalton Dark"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#D85050"           # Red (Syntax string)
export COLOR_03="#5B914E"           # Green (Command)
export COLOR_04="#C4C40C"           # Yellow (Command second)
export COLOR_05="#7AA2F7"           # Blue (Path)
export COLOR_06="#A050D0"           # Magenta (Syntax var)
export COLOR_07="#56717F"           # Cyan (Prompt)
export COLOR_08="#B8B8B8"           # White

export COLOR_09="#494949"           # Bright Black
export COLOR_10="#F07068"           # Bright Red (Command error)
export COLOR_11="#88B97D"           # Bright Green (Exec)
export COLOR_12="#EDED02"           # Bright Yellow
export COLOR_13="#97B1F1"           # Bright Blue (Folder)
export COLOR_14="#C070F0"           # Bright Magenta
export COLOR_15="#6691A7"           # Bright Cyan
export COLOR_16="#D8D8D8"           # Bright White

export BACKGROUND_COLOR="#1B1B1B"   # Background
export FOREGROUND_COLOR="#C8C9CC"   # Foreground (Text)

export CURSOR_COLOR="#9A9A9A" # Cursor

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
