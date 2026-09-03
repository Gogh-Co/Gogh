#!/usr/bin/env bash

export PROFILE_NAME="Glacier"

export COLOR_01="#2E343C"           # Black (Host)
export COLOR_02="#BD0F2F"           # Red (Syntax string)
export COLOR_03="#35A770"           # Green (Command)
export COLOR_04="#FB9435"           # Yellow (Command second)
export COLOR_05="#1F5872"           # Blue (Path)
export COLOR_06="#BD2523"           # Magenta (Syntax var)
export COLOR_07="#778397"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#404A55"           # Bright Black
export COLOR_10="#BD0F2F"           # Bright Red (Command error)
export COLOR_11="#49E998"           # Bright Green (Exec)
export COLOR_12="#FDDF6E"           # Bright Yellow
export COLOR_13="#2A8BC1"           # Bright Blue (Folder)
export COLOR_14="#EA4727"           # Bright Magenta
export COLOR_15="#A0B6D3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0C1115"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#6C6C6C" # Cursor

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
