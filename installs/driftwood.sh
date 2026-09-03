#!/usr/bin/env bash

export PROFILE_NAME="Driftwood"

export COLOR_01="#211D19"           # Black (Host)
export COLOR_02="#E77467"           # Red (Syntax string)
export COLOR_03="#AAB971"           # Green (Command)
export COLOR_04="#E1B869"           # Yellow (Command second)
export COLOR_05="#78B3B5"           # Blue (Path)
export COLOR_06="#C9A0BD"           # Magenta (Syntax var)
export COLOR_07="#A5C4B1"           # Cyan (Prompt)
export COLOR_08="#C2B7A6"           # White

export COLOR_09="#9A8E7C"           # Bright Black
export COLOR_10="#F38F7E"           # Bright Red (Command error)
export COLOR_11="#BECC8A"           # Bright Green (Exec)
export COLOR_12="#E39962"           # Bright Yellow
export COLOR_13="#92C6C7"           # Bright Blue (Folder)
export COLOR_14="#DAB6D1"           # Bright Magenta
export COLOR_15="#BBD6C3"           # Bright Cyan
export COLOR_16="#F2EADB"           # Bright White

export BACKGROUND_COLOR="#2A2622"   # Background
export FOREGROUND_COLOR="#E6DDD0"   # Foreground (Text)

export CURSOR_COLOR="#DFB666" # Cursor

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
