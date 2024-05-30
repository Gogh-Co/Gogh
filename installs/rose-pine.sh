#!/usr/bin/env bash

export PROFILE_NAME="Rosé Pine"

export COLOR_01="#26233A"           # Black (Host)
export COLOR_02="#EB6F92"           # Red (Syntax string)
export COLOR_03="#9CCFD8"           # Green (Command)
export COLOR_04="#F6C177"           # Yellow (Command second)
export COLOR_05="#31748F"           # Blue (Path)
export COLOR_06="#C4A7E7"           # Magenta (Syntax var)
export COLOR_07="#EBBCBA"           # Cyan (Prompt)
export COLOR_08="#E0DEF4"           # White

export COLOR_09="#6E6A86"           # Bright Black
export COLOR_10="#EB6F92"           # Bright Red (Command error)
export COLOR_11="#9CCFD8"           # Bright Green (Exec)
export COLOR_12="#F6C177"           # Bright Yellow
export COLOR_13="#31748F"           # Bright Blue (Folder)
export COLOR_14="#C4A7E7"           # Bright Magenta
export COLOR_15="#EBBCBA"           # Bright Cyan
export COLOR_16="#E0DEF4"           # Bright White

export BACKGROUND_COLOR="#191724"   # Background
export FOREGROUND_COLOR="#E0DEF4"   # Foreground (Text)

export CURSOR_COLOR="#E0DEF4" # Cursor

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
