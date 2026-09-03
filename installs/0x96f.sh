#!/usr/bin/env bash

export PROFILE_NAME="0x96f"

export COLOR_01="#262427"           # Black (Host)
export COLOR_02="#FF7272"           # Red (Syntax string)
export COLOR_03="#BCDF59"           # Green (Command)
export COLOR_04="#FFCA58"           # Yellow (Command second)
export COLOR_05="#49CAE4"           # Blue (Path)
export COLOR_06="#A093E2"           # Magenta (Syntax var)
export COLOR_07="#AEE8F4"           # Cyan (Prompt)
export COLOR_08="#FCFCFA"           # White

export COLOR_09="#545452"           # Bright Black
export COLOR_10="#FF8787"           # Bright Red (Command error)
export COLOR_11="#C6E472"           # Bright Green (Exec)
export COLOR_12="#FFD271"           # Bright Yellow
export COLOR_13="#64D2E8"           # Bright Blue (Folder)
export COLOR_14="#AEA3E6"           # Bright Magenta
export COLOR_15="#BAEBF6"           # Bright Cyan
export COLOR_16="#FCFCFA"           # Bright White

export BACKGROUND_COLOR="#262427"   # Background
export FOREGROUND_COLOR="#FCFCFA"   # Foreground (Text)

export CURSOR_COLOR="#FCFCFA" # Cursor

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
