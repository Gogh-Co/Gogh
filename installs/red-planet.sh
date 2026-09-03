#!/usr/bin/env bash

export PROFILE_NAME="Red Planet"

export COLOR_01="#202020"           # Black (Host)
export COLOR_02="#8C3432"           # Red (Syntax string)
export COLOR_03="#728271"           # Green (Command)
export COLOR_04="#E8BF6A"           # Yellow (Command second)
export COLOR_05="#69819E"           # Blue (Path)
export COLOR_06="#896492"           # Magenta (Syntax var)
export COLOR_07="#5B8390"           # Cyan (Prompt)
export COLOR_08="#B9AA99"           # White

export COLOR_09="#676767"           # Bright Black
export COLOR_10="#B55242"           # Bright Red (Command error)
export COLOR_11="#869985"           # Bright Green (Exec)
export COLOR_12="#EBEB91"           # Bright Yellow
export COLOR_13="#60827E"           # Bright Blue (Folder)
export COLOR_14="#DE4974"           # Bright Magenta
export COLOR_15="#38ADD8"           # Bright Cyan
export COLOR_16="#D6BFB8"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#C2B790"   # Foreground (Text)

export CURSOR_COLOR="#C2B790" # Cursor

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
