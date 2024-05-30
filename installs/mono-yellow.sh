#!/usr/bin/env bash

export PROFILE_NAME="Mono Yellow"

export COLOR_01="#403500"           # Black (Host)
export COLOR_02="#FFD300"           # Red (Syntax string)
export COLOR_03="#FFD300"           # Green (Command)
export COLOR_04="#FFD300"           # Yellow (Command second)
export COLOR_05="#FFD300"           # Blue (Path)
export COLOR_06="#FFD300"           # Magenta (Syntax var)
export COLOR_07="#FFD300"           # Cyan (Prompt)
export COLOR_08="#FFD300"           # White

export COLOR_09="#FFD300"           # Bright Black
export COLOR_10="#FFD300"           # Bright Red (Command error)
export COLOR_11="#FFD300"           # Bright Green (Exec)
export COLOR_12="#FFD300"           # Bright Yellow
export COLOR_13="#FFD300"           # Bright Blue (Folder)
export COLOR_14="#FFD300"           # Bright Magenta
export COLOR_15="#FFD300"           # Bright Cyan
export COLOR_16="#FFD300"           # Bright White

export BACKGROUND_COLOR="#2B2400"   # Background
export FOREGROUND_COLOR="#FFD300"   # Foreground (Text)

export CURSOR_COLOR="#FFD300" # Cursor

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
