#!/usr/bin/env bash

export PROFILE_NAME="Serendipity Midnight"

export COLOR_01="#232534"           # Black (Host)
export COLOR_02="#EE8679"           # Red (Syntax string)
export COLOR_03="#5BA2D0"           # Green (Command)
export COLOR_04="#A78BFA"           # Yellow (Command second)
export COLOR_05="#94B8FF"           # Blue (Path)
export COLOR_06="#9CCFD8"           # Magenta (Syntax var)
export COLOR_07="#F8D2C9"           # Cyan (Prompt)
export COLOR_08="#DEE0EF"           # White

export COLOR_09="#8D8F9E"           # Bright Black
export COLOR_10="#EE8679"           # Bright Red (Command error)
export COLOR_11="#5BA2D0"           # Bright Green (Exec)
export COLOR_12="#A78BFA"           # Bright Yellow
export COLOR_13="#94B8FF"           # Bright Blue (Folder)
export COLOR_14="#9CCFD8"           # Bright Magenta
export COLOR_15="#F8D2C9"           # Bright Cyan
export COLOR_16="#DEE0EF"           # Bright White

export BACKGROUND_COLOR="#151726"   # Background
export FOREGROUND_COLOR="#DEE0EF"   # Foreground (Text)

export CURSOR_COLOR="#6B6D7C" # Cursor

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
