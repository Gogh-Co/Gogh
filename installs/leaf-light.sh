#!/usr/bin/env bash

export PROFILE_NAME="Leaf Light"

export COLOR_01="#2E2C2F"           # Black (Host)
export COLOR_02="#BA5860"           # Red (Syntax string)
export COLOR_03="#729B79"           # Green (Command)
export COLOR_04="#CCAA6C"           # Yellow (Command second)
export COLOR_05="#5292C6"           # Blue (Path)
export COLOR_06="#8C6AA8"           # Magenta (Syntax var)
export COLOR_07="#489CA5"           # Cyan (Prompt)
export COLOR_08="#E1E4DC"           # White

export COLOR_09="#403F42"           # Bright Black
export COLOR_10="#9D4B53"           # Bright Red (Command error)
export COLOR_11="#59795F"           # Bright Green (Exec)
export COLOR_12="#A78A58"           # Bright Yellow
export COLOR_13="#40739A"           # Bright Blue (Folder)
export COLOR_14="#715688"           # Bright Magenta
export COLOR_15="#3B8187"           # Bright Cyan
export COLOR_16="#B1B3AD"           # Bright White

export BACKGROUND_COLOR="#E1E4DC"   # Background
export FOREGROUND_COLOR="#2E2C2F"   # Foreground (Text)

export CURSOR_COLOR="#2E2C2F" # Cursor

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
