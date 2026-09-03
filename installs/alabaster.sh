#!/usr/bin/env bash

export PROFILE_NAME="Alabaster"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#AA3731"           # Red (Syntax string)
export COLOR_03="#448C27"           # Green (Command)
export COLOR_04="#CB9000"           # Yellow (Command second)
export COLOR_05="#325CC0"           # Blue (Path)
export COLOR_06="#7A3E9D"           # Magenta (Syntax var)
export COLOR_07="#0083B2"           # Cyan (Prompt)
export COLOR_08="#F7F7F7"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#F05050"           # Bright Red (Command error)
export COLOR_11="#60CB00"           # Bright Green (Exec)
export COLOR_12="#FFBC5D"           # Bright Yellow
export COLOR_13="#007ACC"           # Bright Blue (Folder)
export COLOR_14="#E64CE6"           # Bright Magenta
export COLOR_15="#00AACB"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#F7F7F7"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#007ACC" # Cursor

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
