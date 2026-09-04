#!/usr/bin/env bash

export PROFILE_NAME="Iris"

export COLOR_01="#111133"           # Black (Host)
export COLOR_02="#D61D52"           # Red (Syntax string)
export COLOR_03="#48A842"           # Green (Command)
export COLOR_04="#E1A51C"           # Yellow (Command second)
export COLOR_05="#5556D3"           # Blue (Path)
export COLOR_06="#8650D3"           # Magenta (Syntax var)
export COLOR_07="#52AFB7"           # Cyan (Prompt)
export COLOR_08="#9F9AA7"           # White

export COLOR_09="#484867"           # Bright Black
export COLOR_10="#E15877"           # Bright Red (Command error)
export COLOR_11="#71AB3A"           # Bright Green (Exec)
export COLOR_12="#C6A642"           # Bright Yellow
export COLOR_13="#6D6DC9"           # Bright Blue (Folder)
export COLOR_14="#956AD3"           # Bright Magenta
export COLOR_15="#6AB6BD"           # Bright Cyan
export COLOR_16="#E8E6E9"           # Bright White

export BACKGROUND_COLOR="#272537"   # Background
export FOREGROUND_COLOR="#E8E6E9"   # Foreground (Text)

export CURSOR_COLOR="#E8E6E9" # Cursor

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
