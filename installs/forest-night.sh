#!/usr/bin/env bash

export PROFILE_NAME="Forest Night"

export COLOR_01="#7F8F9F"           # Black (Host)
export COLOR_02="#FD8489"           # Red (Syntax string)
export COLOR_03="#A9DD9D"           # Green (Command)
export COLOR_04="#F0AA8A"           # Yellow (Command second)
export COLOR_05="#BDD0E5"           # Blue (Path)
export COLOR_06="#DACCF0"           # Magenta (Syntax var)
export COLOR_07="#A9DD9D"           # Cyan (Prompt)
export COLOR_08="#FFEBC3"           # White

export COLOR_09="#7F8F9F"           # Bright Black
export COLOR_10="#FD8489"           # Bright Red (Command error)
export COLOR_11="#A9DD9D"           # Bright Green (Exec)
export COLOR_12="#EED094"           # Bright Yellow
export COLOR_13="#BDD0E5"           # Bright Blue (Folder)
export COLOR_14="#DACCF0"           # Bright Magenta
export COLOR_15="#A9DD9D"           # Bright Cyan
export COLOR_16="#FFEBC3"           # Bright White

export BACKGROUND_COLOR="#3C4C55"   # Background
export FOREGROUND_COLOR="#FFEBC3"   # Foreground (Text)

export CURSOR_COLOR="#FFEBC3" # Cursor

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
