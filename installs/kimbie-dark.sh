#!/usr/bin/env bash

export PROFILE_NAME="Kimbie Dark"

export COLOR_01="#221A0F"           # Black (Host)
export COLOR_02="#C87E5A"           # Red (Syntax string)
export COLOR_03="#879A6B"           # Green (Command)
export COLOR_04="#E4B581"           # Yellow (Command second)
export COLOR_05="#5D90CD"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#6BBAB2"           # Cyan (Prompt)
export COLOR_08="#D3AF86"           # White

export COLOR_09="#7D6F48"           # Bright Black
export COLOR_10="#C87E5A"           # Bright Red (Command error)
export COLOR_11="#879A6B"           # Bright Green (Exec)
export COLOR_12="#E4B581"           # Bright Yellow
export COLOR_13="#5D90CD"           # Bright Blue (Folder)
export COLOR_14="#C792EA"           # Bright Magenta
export COLOR_15="#6BBAB2"           # Bright Cyan
export COLOR_16="#F2CCA8"           # Bright White

export BACKGROUND_COLOR="#221A0F"   # Background
export FOREGROUND_COLOR="#D3AF86"   # Foreground (Text)

export CURSOR_COLOR="#D3AF86" # Cursor

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
