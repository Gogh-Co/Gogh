#!/usr/bin/env bash

export PROFILE_NAME="Tempus Winter"

export COLOR_01="#202427"           # Black (Host)
export COLOR_02="#ed6e5a"           # Red (Syntax string)
export COLOR_03="#4aa920"           # Green (Command)
export COLOR_04="#9a9921"           # Yellow (Command second)
export COLOR_05="#7b91df"           # Blue (Path)
export COLOR_06="#d17e80"           # Magenta (Syntax var)
export COLOR_07="#4fa394"           # Cyan (Prompt)
export COLOR_08="#91959b"           # White

export COLOR_09="#2a2e38"           # Bright Black
export COLOR_10="#de7b28"           # Bright Red (Command error)
export COLOR_11="#00ab5f"           # Bright Green (Exec)
export COLOR_12="#af9155"           # Bright Yellow
export COLOR_13="#329fcb"           # Bright Blue (Folder)
export COLOR_14="#ca77c5"           # Bright Magenta
export COLOR_15="#1ba6a4"           # Bright Cyan
export COLOR_16="#8da3b8"           # Bright White

export BACKGROUND_COLOR="#202427"   # Background
export FOREGROUND_COLOR="#8da3b8"   # Foreground (Text)

export CURSOR_COLOR="#8da3b8" # Cursor

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
