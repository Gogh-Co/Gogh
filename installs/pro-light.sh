#!/usr/bin/env bash

export PROFILE_NAME="Pro Light"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E5492B"           # Red (Syntax string)
export COLOR_03="#50D148"           # Green (Command)
export COLOR_04="#C6C440"           # Yellow (Command second)
export COLOR_05="#3B75FF"           # Blue (Path)
export COLOR_06="#ED66E8"           # Magenta (Syntax var)
export COLOR_07="#4ED2DE"           # Cyan (Prompt)
export COLOR_08="#DCDCDC"           # White

export COLOR_09="#9F9F9F"           # Bright Black
export COLOR_10="#FF6640"           # Bright Red (Command error)
export COLOR_11="#61EF57"           # Bright Green (Exec)
export COLOR_12="#F2F156"           # Bright Yellow
export COLOR_13="#0082FF"           # Bright Blue (Folder)
export COLOR_14="#FF7EFF"           # Bright Magenta
export COLOR_15="#61F7F8"           # Bright Cyan
export COLOR_16="#F2F2F2"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#191919"   # Foreground (Text)

export CURSOR_COLOR="#4D4D4D" # Cursor

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
