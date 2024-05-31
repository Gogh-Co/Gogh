#!/usr/bin/env bash

export PROFILE_NAME="Novel"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#CC0000"           # Red (Syntax string)
export COLOR_03="#009600"           # Green (Command)
export COLOR_04="#D06B00"           # Yellow (Command second)
export COLOR_05="#0000CC"           # Blue (Path)
export COLOR_06="#CC00CC"           # Magenta (Syntax var)
export COLOR_07="#0087CC"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#CC0000"           # Bright Red (Command error)
export COLOR_11="#009600"           # Bright Green (Exec)
export COLOR_12="#D06B00"           # Bright Yellow
export COLOR_13="#0000CC"           # Bright Blue (Folder)
export COLOR_14="#CC00CC"           # Bright Magenta
export COLOR_15="#0087CC"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#DFDBC3"   # Background
export FOREGROUND_COLOR="#3B2322"   # Foreground (Text)

export CURSOR_COLOR="#3B2322" # Cursor

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
