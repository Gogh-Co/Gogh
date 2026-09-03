#!/usr/bin/env bash

export PROFILE_NAME="Claude Dark"

export COLOR_01="#888681"           # Black (Host)
export COLOR_02="#D47563"           # Red (Syntax string)
export COLOR_03="#9ACA86"           # Green (Command)
export COLOR_04="#E8C96B"           # Yellow (Command second)
export COLOR_05="#6A9BCC"           # Blue (Path)
export COLOR_06="#9B87F5"           # Magenta (Syntax var)
export COLOR_07="#3CBE8C"           # Cyan (Prompt)
export COLOR_08="#E2E1DA"           # White

export COLOR_09="#A6A59B"           # Bright Black
export COLOR_10="#F4A9A9"           # Bright Red (Command error)
export COLOR_11="#A8D166"           # Bright Green (Exec)
export COLOR_12="#FAB319"           # Bright Yellow
export COLOR_13="#9FC5F4"           # Bright Blue (Folder)
export COLOR_14="#F3AAC5"           # Bright Magenta
export COLOR_15="#79D7B3"           # Bright Cyan
export COLOR_16="#EFEEEB"           # Bright White

export BACKGROUND_COLOR="#262624"   # Background
export FOREGROUND_COLOR="#E5E4E1"   # Foreground (Text)

export CURSOR_COLOR="#D97757" # Cursor

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
