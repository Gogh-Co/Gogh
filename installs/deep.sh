#!/usr/bin/env bash

export PROFILE_NAME="Deep"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D70005"           # Red (Syntax string)
export COLOR_03="#1CD915"           # Green (Command)
export COLOR_04="#D9BD26"           # Yellow (Command second)
export COLOR_05="#5665FF"           # Blue (Path)
export COLOR_06="#B052DA"           # Magenta (Syntax var)
export COLOR_07="#50D2DA"           # Cyan (Prompt)
export COLOR_08="#E0E0E0"           # White

export COLOR_09="#535353"           # Bright Black
export COLOR_10="#FB0007"           # Bright Red (Command error)
export COLOR_11="#22FF18"           # Bright Green (Exec)
export COLOR_12="#FEDC2B"           # Bright Yellow
export COLOR_13="#9FA9FF"           # Bright Blue (Folder)
export COLOR_14="#E09AFF"           # Bright Magenta
export COLOR_15="#8DF9FF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#090909"   # Background
export FOREGROUND_COLOR="#CDCDCD"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
