#!/usr/bin/env bash

export PROFILE_NAME="Darkside"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#E8341C"           # Red (Syntax string)
export COLOR_03="#68C256"           # Green (Command)
export COLOR_04="#F2D42C"           # Yellow (Command second)
export COLOR_05="#1C98E8"           # Blue (Path)
export COLOR_06="#8E69C9"           # Magenta (Syntax var)
export COLOR_07="#1C98E8"           # Cyan (Prompt)
export COLOR_08="#BABABA"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#E05A4F"           # Bright Red (Command error)
export COLOR_11="#77B869"           # Bright Green (Exec)
export COLOR_12="#EFD64B"           # Bright Yellow
export COLOR_13="#387CD3"           # Bright Blue (Folder)
export COLOR_14="#957BBE"           # Bright Magenta
export COLOR_15="#3D97E2"           # Bright Cyan
export COLOR_16="#BABABA"           # Bright White

export BACKGROUND_COLOR="#222324"   # Background
export FOREGROUND_COLOR="#BABABA"   # Foreground (Text)

export CURSOR_COLOR="#BABABA" # Cursor

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
