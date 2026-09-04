#!/usr/bin/env bash

export PROFILE_NAME="Atlas"

export COLOR_01="#002635"           # Black (Host)
export COLOR_02="#FF5A67"           # Red (Syntax string)
export COLOR_03="#7FC06E"           # Green (Command)
export COLOR_04="#FFCC1B"           # Yellow (Command second)
export COLOR_05="#14747E"           # Blue (Path)
export COLOR_06="#9A70A4"           # Magenta (Syntax var)
export COLOR_07="#5DD7B9"           # Cyan (Prompt)
export COLOR_08="#A1A19A"           # White

export COLOR_09="#6C8B91"           # Bright Black
export COLOR_10="#FF5A67"           # Bright Red (Command error)
export COLOR_11="#7FC06E"           # Bright Green (Exec)
export COLOR_12="#FFCC1B"           # Bright Yellow
export COLOR_13="#14747E"           # Bright Blue (Folder)
export COLOR_14="#9A70A4"           # Bright Magenta
export COLOR_15="#5DD7B9"           # Bright Cyan
export COLOR_16="#FAFAF8"           # Bright White

export BACKGROUND_COLOR="#002635"   # Background
export FOREGROUND_COLOR="#A1A19A"   # Foreground (Text)

export CURSOR_COLOR="#A1A19A" # Cursor

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
