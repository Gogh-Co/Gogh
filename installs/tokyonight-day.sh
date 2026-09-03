#!/usr/bin/env bash

export PROFILE_NAME="TokyoNight Day"

export COLOR_01="#E9E9ED"           # Black (Host)
export COLOR_02="#F52A65"           # Red (Syntax string)
export COLOR_03="#587539"           # Green (Command)
export COLOR_04="#8C6C3E"           # Yellow (Command second)
export COLOR_05="#2E7DE9"           # Blue (Path)
export COLOR_06="#9854F1"           # Magenta (Syntax var)
export COLOR_07="#007197"           # Cyan (Prompt)
export COLOR_08="#6172B0"           # White

export COLOR_09="#A1A6C5"           # Bright Black
export COLOR_10="#F52A65"           # Bright Red (Command error)
export COLOR_11="#587539"           # Bright Green (Exec)
export COLOR_12="#8C6C3E"           # Bright Yellow
export COLOR_13="#2E7DE9"           # Bright Blue (Folder)
export COLOR_14="#9854F1"           # Bright Magenta
export COLOR_15="#007197"           # Bright Cyan
export COLOR_16="#3760BF"           # Bright White

export BACKGROUND_COLOR="#E1E2E7"   # Background
export FOREGROUND_COLOR="#3760BF"   # Foreground (Text)

export CURSOR_COLOR="#3760BF" # Cursor

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
