#!/usr/bin/env bash

export PROFILE_NAME="Calamity"

export COLOR_01="#2F2833"           # Black (Host)
export COLOR_02="#FC644D"           # Red (Syntax string)
export COLOR_03="#A5F69C"           # Green (Command)
export COLOR_04="#E9D7A5"           # Yellow (Command second)
export COLOR_05="#3B79C7"           # Blue (Path)
export COLOR_06="#F92672"           # Magenta (Syntax var)
export COLOR_07="#74D3DE"           # Cyan (Prompt)
export COLOR_08="#D5CED9"           # White

export COLOR_09="#7E6C88"           # Bright Black
export COLOR_10="#FC644D"           # Bright Red (Command error)
export COLOR_11="#A5F69C"           # Bright Green (Exec)
export COLOR_12="#E9D7A5"           # Bright Yellow
export COLOR_13="#3B79C7"           # Bright Blue (Folder)
export COLOR_14="#F92672"           # Bright Magenta
export COLOR_15="#74D3DE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2F2833"   # Background
export FOREGROUND_COLOR="#D5CED9"   # Foreground (Text)

export CURSOR_COLOR="#D5CED9" # Cursor

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
