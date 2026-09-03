#!/usr/bin/env bash

export PROFILE_NAME="Hot Dog Stand"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FFFF54"           # Red (Syntax string)
export COLOR_03="#FFFF54"           # Green (Command)
export COLOR_04="#FFFF54"           # Yellow (Command second)
export COLOR_05="#000000"           # Blue (Path)
export COLOR_06="#FFFF54"           # Magenta (Syntax var)
export COLOR_07="#FFFFFF"           # Cyan (Prompt)
export COLOR_08="#C6C6C6"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FFFF54"           # Bright Red (Command error)
export COLOR_11="#FFFF54"           # Bright Green (Exec)
export COLOR_12="#FFFF54"           # Bright Yellow
export COLOR_13="#000000"           # Bright Blue (Folder)
export COLOR_14="#FFFF54"           # Bright Magenta
export COLOR_15="#FFFFFF"           # Bright Cyan
export COLOR_16="#C6C6C6"           # Bright White

export BACKGROUND_COLOR="#EA3323"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFF54" # Cursor

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
