#!/usr/bin/env bash

export PROFILE_NAME="Moonwalk"

export COLOR_01="#080808"           # Black (Host)
export COLOR_02="#7A0047"           # Red (Syntax string)
export COLOR_03="#145B0E"           # Green (Command)
export COLOR_04="#733A11"           # Yellow (Command second)
export COLOR_05="#002FA7"           # Blue (Path)
export COLOR_06="#5400A8"           # Magenta (Syntax var)
export COLOR_07="#00566B"           # Cyan (Prompt)
export COLOR_08="#9C958D"           # White

export COLOR_09="#494440"           # Bright Black
export COLOR_10="#AF1608"           # Bright Red (Command error)
export COLOR_11="#4C6129"           # Bright Green (Exec)
export COLOR_12="#7A5000"           # Bright Yellow
export COLOR_13="#0D50C5"           # Bright Blue (Folder)
export COLOR_14="#952197"           # Bright Magenta
export COLOR_15="#006092"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#E4E2E0"   # Background
export FOREGROUND_COLOR="#061F4A"   # Foreground (Text)

export CURSOR_COLOR="#061F4A" # Cursor

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
