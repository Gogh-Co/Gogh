#!/usr/bin/env bash

export PROFILE_NAME="urban"

export COLOR_01="#32303A"           # Black (Host)
export COLOR_02="#7E444F"           # Red (Syntax string)
export COLOR_03="#7A9256"           # Green (Command)
export COLOR_04="#A78560"           # Yellow (Command second)
export COLOR_05="#5F5770"           # Blue (Path)
export COLOR_06="#704156"           # Magenta (Syntax var)
export COLOR_07="#534856"           # Cyan (Prompt)
export COLOR_08="#BCA89C"           # White

export COLOR_09="#4E4B57"           # Bright Black
export COLOR_10="#7E444F"           # Bright Red (Command error)
export COLOR_11="#7A9256"           # Bright Green (Exec)
export COLOR_12="#A78560"           # Bright Yellow
export COLOR_13="#5F5770"           # Bright Blue (Folder)
export COLOR_14="#704156"           # Bright Magenta
export COLOR_15="#534856"           # Bright Cyan
export COLOR_16="#BCA89C"           # Bright White

export BACKGROUND_COLOR="#302E38"   # Background
export FOREGROUND_COLOR="#BCA89C"   # Foreground (Text)

export CURSOR_COLOR="#BCA89C" # Cursor

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
