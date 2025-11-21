#!/usr/bin/env bash

export PROFILE_NAME="Vacme"

export COLOR_01="#424242"           # Black (Host)
export COLOR_02="#B85C57"           # Red (Syntax string)
export COLOR_03="#57864E"           # Green (Command)
export COLOR_04="#8F7634"           # Yellow (Command second)
export COLOR_05="#2A8DC5"           # Blue (Path)
export COLOR_06="#8888C7"           # Magenta (Syntax var)
export COLOR_07="#6AA7A8"           # Cyan (Prompt)
export COLOR_08="#FFFFEC"           # White

export COLOR_09="#999957"           # Bright Black
export COLOR_10="#E28C88"           # Bright Red (Command error)
export COLOR_11="#7AB877"           # Bright Green (Exec)
export COLOR_12="#9E9477"           # Bright Yellow
export COLOR_13="#7EC6EB"           # Bright Blue (Folder)
export COLOR_14="#A9ABDA"           # Bright Magenta
export COLOR_15="#7AD0D1"           # Bright Cyan
export COLOR_16="#D6D687"           # Bright White

export BACKGROUND_COLOR="#FFFFEC"   # Background
export FOREGROUND_COLOR="#424242"   # Foreground (Text)

export CURSOR_COLOR="#030093" # Cursor

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
