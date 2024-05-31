#!/usr/bin/env bash

export PROFILE_NAME="Zenburn"

export COLOR_01="#333333"           # Black (Host)
export COLOR_02="#cc9393"           # Red (Syntax string)
export COLOR_03="#efef87"           # Green (Command)
export COLOR_04="#ffd7a7"           # Yellow (Command second)
export COLOR_05="#c3bf97"           # Blue (Path)
export COLOR_06="#bca3a3"           # Magenta (Syntax var)
export COLOR_07="#93b3a3"           # Cyan (Prompt)
export COLOR_08="#f0efd0"           # White

export COLOR_09="#757575"           # Bright Black
export COLOR_10="#dfaf87"           # Bright Red (Command error)
export COLOR_11="#ffff87"           # Bright Green (Exec)
export COLOR_12="#ffcfaf"           # Bright Yellow
export COLOR_13="#d7d7af"           # Bright Blue (Folder)
export COLOR_14="#d7afaf"           # Bright Magenta
export COLOR_15="#93bea3"           # Bright Cyan
export COLOR_16="#dcdccc"           # Bright White

export BACKGROUND_COLOR="#3a3a3a"   # Background
export FOREGROUND_COLOR="#dcdccc"   # Foreground (Text)

export CURSOR_COLOR="#dcdccc" # Cursor

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
