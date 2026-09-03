#!/usr/bin/env bash

export PROFILE_NAME="Spacegray Bright"

export COLOR_01="#080808"           # Black (Host)
export COLOR_02="#BC5553"           # Red (Syntax string)
export COLOR_03="#A0B56C"           # Green (Command)
export COLOR_04="#F6C987"           # Yellow (Command second)
export COLOR_05="#7BAEC1"           # Blue (Path)
export COLOR_06="#B98AAE"           # Magenta (Syntax var)
export COLOR_07="#85C9B8"           # Cyan (Prompt)
export COLOR_08="#D8D8D8"           # White

export COLOR_09="#626262"           # Bright Black
export COLOR_10="#BC5553"           # Bright Red (Command error)
export COLOR_11="#A0B56C"           # Bright Green (Exec)
export COLOR_12="#F6C987"           # Bright Yellow
export COLOR_13="#7BAEC1"           # Bright Blue (Folder)
export COLOR_14="#B98AAE"           # Bright Magenta
export COLOR_15="#85C9B8"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#2A2E3A"   # Background
export FOREGROUND_COLOR="#F3F3F3"   # Foreground (Text)

export CURSOR_COLOR="#C6C6C6" # Cursor

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
