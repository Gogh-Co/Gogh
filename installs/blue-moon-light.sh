#!/usr/bin/env bash

export PROFILE_NAME="Blue Moon Light"

export COLOR_01="#292D3E"           # Black (Host)
export COLOR_02="#D06179"           # Red (Syntax string)
export COLOR_03="#D0E7D0"           # Green (Command)
export COLOR_04="#CFCFBF"           # Yellow (Command second)
export COLOR_05="#959DCB"           # Blue (Path)
export COLOR_06="#A9A3DB"           # Magenta (Syntax var)
export COLOR_07="#89BBDD"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#292D3E"           # Bright Black
export COLOR_10="#D06179"           # Bright Red (Command error)
export COLOR_11="#D0E7D0"           # Bright Green (Exec)
export COLOR_12="#CFCFBF"           # Bright Yellow
export COLOR_13="#959DCB"           # Bright Blue (Folder)
export COLOR_14="#A9A3DB"           # Bright Magenta
export COLOR_15="#89BBDD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#32374D"   # Background
export FOREGROUND_COLOR="#FBFBFB"   # Foreground (Text)

export CURSOR_COLOR="#FBFBFB" # Cursor

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
