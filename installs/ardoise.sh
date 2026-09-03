#!/usr/bin/env bash

export PROFILE_NAME="Ardoise"

export COLOR_01="#2C2C2C"           # Black (Host)
export COLOR_02="#D3322D"           # Red (Syntax string)
export COLOR_03="#588B35"           # Green (Command)
export COLOR_04="#FCA93A"           # Yellow (Command second)
export COLOR_05="#2465C2"           # Blue (Path)
export COLOR_06="#7332B4"           # Magenta (Syntax var)
export COLOR_07="#64E1B8"           # Cyan (Prompt)
export COLOR_08="#F7F7F7"           # White

export COLOR_09="#535353"           # Bright Black
export COLOR_10="#FA5852"           # Bright Red (Command error)
export COLOR_11="#8DC252"           # Bright Green (Exec)
export COLOR_12="#FFEA51"           # Bright Yellow
export COLOR_13="#6AB5F8"           # Bright Blue (Folder)
export COLOR_14="#BE68CA"           # Bright Magenta
export COLOR_15="#89FFDB"           # Bright Cyan
export COLOR_16="#FEFEFE"           # Bright White

export BACKGROUND_COLOR="#1E1E1E"   # Background
export FOREGROUND_COLOR="#EAEAEA"   # Foreground (Text)

export CURSOR_COLOR="#F7F7F7" # Cursor

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
