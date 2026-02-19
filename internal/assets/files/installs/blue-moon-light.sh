#!/usr/bin/env bash

export PROFILE_NAME="Blue Moon Light"

export COLOR_01="#292d3e"           # Black (Host)
export COLOR_02="#d06179"           # Red (Syntax string)
export COLOR_03="#d0e7d0"           # Green (Command)
export COLOR_04="#cfcfbf"           # Yellow (Command second)
export COLOR_05="#959dcb"           # Blue (Path)
export COLOR_06="#a9a3db"           # Magenta (Syntax var)
export COLOR_07="#89bbdd"           # Cyan (Prompt)
export COLOR_08="#ffffff"           # White

export COLOR_09="#292d3e"           # Bright Black
export COLOR_10="#d06179"           # Bright Red (Command error)
export COLOR_11="#d0e7d0"           # Bright Green (Exec)
export COLOR_12="#cfcfbf"           # Bright Yellow
export COLOR_13="#959dcb"           # Bright Blue (Folder)
export COLOR_14="#a9a3db"           # Bright Magenta
export COLOR_15="#89bbdd"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#32374d"   # Background
export FOREGROUND_COLOR="#fbfbfb"   # Foreground (Text)

export CURSOR_COLOR="#fbfbfb" # Cursor

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
