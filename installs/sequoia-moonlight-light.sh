#!/usr/bin/env bash

export PROFILE_NAME="Sequoia Moonlight Light"

export COLOR_01="#D4D5DC"           # Black (Host)
export COLOR_02="#C94DA8"           # Red (Syntax string)
export COLOR_03="#4A85D4"           # Green (Command)
export COLOR_04="#6A6A78"           # Yellow (Command second)
export COLOR_05="#9A5FD9"           # Blue (Path)
export COLOR_06="#282930"           # Magenta (Syntax var)
export COLOR_07="#D9884A"           # Cyan (Prompt)
export COLOR_08="#282930"           # White

export COLOR_09="#42434E"           # Bright Black
export COLOR_10="#C94DA8"           # Bright Red (Command error)
export COLOR_11="#4A85D4"           # Bright Green (Exec)
export COLOR_12="#6A6A78"           # Bright Yellow
export COLOR_13="#9A5FD9"           # Bright Blue (Folder)
export COLOR_14="#282930"           # Bright Magenta
export COLOR_15="#D9884A"           # Bright Cyan
export COLOR_16="#282930"           # Bright White

export BACKGROUND_COLOR="#EDEEF2"   # Background
export FOREGROUND_COLOR="#282930"   # Foreground (Text)

export CURSOR_COLOR="#565760" # Cursor

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
