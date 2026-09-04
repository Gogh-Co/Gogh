#!/usr/bin/env bash

export PROFILE_NAME="Desert Night"

export COLOR_01="#473F31"           # Black (Host)
export COLOR_02="#E56B55"           # Red (Syntax string)
export COLOR_03="#99B05F"           # Green (Command)
export COLOR_04="#E18245"           # Yellow (Command second)
export COLOR_05="#949FB4"           # Blue (Path)
export COLOR_06="#D261A5"           # Magenta (Syntax var)
export COLOR_07="#BFAB36"           # Cyan (Prompt)
export COLOR_08="#87765D"           # White

export COLOR_09="#473F31"           # Bright Black
export COLOR_10="#E56B55"           # Bright Red (Command error)
export COLOR_11="#99B05F"           # Bright Green (Exec)
export COLOR_12="#E5A440"           # Bright Yellow
export COLOR_13="#949FB4"           # Bright Blue (Folder)
export COLOR_14="#D261A5"           # Bright Magenta
export COLOR_15="#BFAB36"           # Bright Cyan
export COLOR_16="#87765D"           # Bright White

export BACKGROUND_COLOR="#24221C"   # Background
export FOREGROUND_COLOR="#D4B07B"   # Foreground (Text)

export CURSOR_COLOR="#D4B07B" # Cursor

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
