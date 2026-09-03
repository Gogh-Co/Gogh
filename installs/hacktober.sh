#!/usr/bin/env bash

export PROFILE_NAME="Hacktober"

export COLOR_01="#191918"           # Black (Host)
export COLOR_02="#B34538"           # Red (Syntax string)
export COLOR_03="#587744"           # Green (Command)
export COLOR_04="#D08949"           # Yellow (Command second)
export COLOR_05="#206EC5"           # Blue (Path)
export COLOR_06="#864651"           # Magenta (Syntax var)
export COLOR_07="#AC9166"           # Cyan (Prompt)
export COLOR_08="#F1EEE7"           # White

export COLOR_09="#2C2B2A"           # Bright Black
export COLOR_10="#B33323"           # Bright Red (Command error)
export COLOR_11="#42824A"           # Bright Green (Exec)
export COLOR_12="#C75A22"           # Bright Yellow
export COLOR_13="#5389C5"           # Bright Blue (Folder)
export COLOR_14="#E795A5"           # Bright Magenta
export COLOR_15="#EBC587"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#C9C9C9"   # Foreground (Text)

export CURSOR_COLOR="#C9C9C9" # Cursor

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
