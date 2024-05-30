#!/usr/bin/env bash

export PROFILE_NAME="Google Light"

export COLOR_01="#202124"           # Black (Host)
export COLOR_02="#EA4335"           # Red (Syntax string)
export COLOR_03="#34A853"           # Green (Command)
export COLOR_04="#FBBC04"           # Yellow (Command second)
export COLOR_05="#4285F4"           # Blue (Path)
export COLOR_06="#A142F4"           # Magenta (Syntax var)
export COLOR_07="#24C1E0"           # Cyan (Prompt)
export COLOR_08="#E8EAED"           # White

export COLOR_09="#5F6368"           # Bright Black
export COLOR_10="#EA4335"           # Bright Red (Command error)
export COLOR_11="#34A853"           # Bright Green (Exec)
export COLOR_12="#FBBC05"           # Bright Yellow
export COLOR_13="#4285F4"           # Bright Blue (Folder)
export COLOR_14="#A142F4"           # Bright Magenta
export COLOR_15="#24C1E0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#5F6368"   # Foreground (Text)

export CURSOR_COLOR="#5F6368" # Cursor

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
