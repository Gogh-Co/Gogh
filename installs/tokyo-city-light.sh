#!/usr/bin/env bash

export PROFILE_NAME="Tokyo City Light"

export COLOR_01="#FBFBFD"           # Black (Host)
export COLOR_02="#8C4351"           # Red (Syntax string)
export COLOR_03="#485E30"           # Green (Command)
export COLOR_04="#4C505E"           # Yellow (Command second)
export COLOR_05="#34548A"           # Blue (Path)
export COLOR_06="#5A4A78"           # Magenta (Syntax var)
export COLOR_07="#4C505E"           # Cyan (Prompt)
export COLOR_08="#343B59"           # White

export COLOR_09="#9699A3"           # Bright Black
export COLOR_10="#8C4351"           # Bright Red (Command error)
export COLOR_11="#485E30"           # Bright Green (Exec)
export COLOR_12="#4C505E"           # Bright Yellow
export COLOR_13="#34548A"           # Bright Blue (Folder)
export COLOR_14="#5A4A78"           # Bright Magenta
export COLOR_15="#4C505E"           # Bright Cyan
export COLOR_16="#171D23"           # Bright White

export BACKGROUND_COLOR="#FBFBFD"   # Background
export FOREGROUND_COLOR="#343B59"   # Foreground (Text)

export CURSOR_COLOR="#343B59" # Cursor

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
