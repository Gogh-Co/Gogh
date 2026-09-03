#!/usr/bin/env bash

export PROFILE_NAME="Blue Berry Pie"

export COLOR_01="#0A4C62"           # Black (Host)
export COLOR_02="#99246E"           # Red (Syntax string)
export COLOR_03="#5CB1B3"           # Green (Command)
export COLOR_04="#EAB9A8"           # Yellow (Command second)
export COLOR_05="#90A5BD"           # Blue (Path)
export COLOR_06="#9D54A7"           # Magenta (Syntax var)
export COLOR_07="#7E83CC"           # Cyan (Prompt)
export COLOR_08="#F0E8D6"           # White

export COLOR_09="#201637"           # Bright Black
export COLOR_10="#C87272"           # Bright Red (Command error)
export COLOR_11="#0A6C7E"           # Bright Green (Exec)
export COLOR_12="#7A3188"           # Bright Yellow
export COLOR_13="#39173D"           # Bright Blue (Folder)
export COLOR_14="#BC94B7"           # Bright Magenta
export COLOR_15="#5E6071"           # Bright Cyan
export COLOR_16="#0A6C7E"           # Bright White

export BACKGROUND_COLOR="#1C0C28"   # Background
export FOREGROUND_COLOR="#BABAB9"   # Foreground (Text)

export CURSOR_COLOR="#FCFAD6" # Cursor

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
