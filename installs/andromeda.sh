#!/usr/bin/env bash

export PROFILE_NAME="Andromeda"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CD3131"           # Red (Syntax string)
export COLOR_03="#05BC79"           # Green (Command)
export COLOR_04="#E5E512"           # Yellow (Command second)
export COLOR_05="#2472C8"           # Blue (Path)
export COLOR_06="#BC3FBC"           # Magenta (Syntax var)
export COLOR_07="#0FA8CD"           # Cyan (Prompt)
export COLOR_08="#E5E5E5"           # White

export COLOR_09="#666666"           # Bright Black
export COLOR_10="#CD3131"           # Bright Red (Command error)
export COLOR_11="#05BC79"           # Bright Green (Exec)
export COLOR_12="#E5E512"           # Bright Yellow
export COLOR_13="#2472C8"           # Bright Blue (Folder)
export COLOR_14="#BC3FBC"           # Bright Magenta
export COLOR_15="#0FA8CD"           # Bright Cyan
export COLOR_16="#E5E5E5"           # Bright White

export BACKGROUND_COLOR="#262A33"   # Background
export FOREGROUND_COLOR="#E5E5E5"   # Foreground (Text)

export CURSOR_COLOR="#F8F8F0" # Cursor

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
