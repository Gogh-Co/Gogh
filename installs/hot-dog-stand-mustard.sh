#!/usr/bin/env bash

export PROFILE_NAME="Hot Dog Stand (Mustard)"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#EA3323"           # Red (Syntax string)
export COLOR_03="#EA3323"           # Green (Command)
export COLOR_04="#EA3323"           # Yellow (Command second)
export COLOR_05="#000000"           # Blue (Path)
export COLOR_06="#EA3323"           # Magenta (Syntax var)
export COLOR_07="#000000"           # Cyan (Prompt)
export COLOR_08="#B9B9B9"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#EA3323"           # Bright Red (Command error)
export COLOR_11="#EA3323"           # Bright Green (Exec)
export COLOR_12="#EA3323"           # Bright Yellow
export COLOR_13="#000000"           # Bright Blue (Folder)
export COLOR_14="#EA3323"           # Bright Magenta
export COLOR_15="#000000"           # Bright Cyan
export COLOR_16="#C6C6C6"           # Bright White

export BACKGROUND_COLOR="#FFFF54"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#EA3323" # Cursor

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
