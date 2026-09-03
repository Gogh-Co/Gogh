#!/usr/bin/env bash

export PROFILE_NAME="Nebula Drift"

export COLOR_01="#1A0E38"           # Black (Host)
export COLOR_02="#FF5C8D"           # Red (Syntax string)
export COLOR_03="#66E6A8"           # Green (Command)
export COLOR_04="#FFCB6B"           # Yellow (Command second)
export COLOR_05="#7C9BFF"           # Blue (Path)
export COLOR_06="#C77DFF"           # Magenta (Syntax var)
export COLOR_07="#57E6F0"           # Cyan (Prompt)
export COLOR_08="#C8C6E8"           # White

export COLOR_09="#5C5A88"           # Bright Black
export COLOR_10="#FF5C8D"           # Bright Red (Command error)
export COLOR_11="#66E6A8"           # Bright Green (Exec)
export COLOR_12="#FF9E64"           # Bright Yellow
export COLOR_13="#7C9BFF"           # Bright Blue (Folder)
export COLOR_14="#C77DFF"           # Bright Magenta
export COLOR_15="#57E6F0"           # Bright Cyan
export COLOR_16="#E2E0FA"           # Bright White

export BACKGROUND_COLOR="#0A0420"   # Background
export FOREGROUND_COLOR="#E2E0FA"   # Foreground (Text)

export CURSOR_COLOR="#D58BFF" # Cursor

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
