#!/usr/bin/env bash

export PROFILE_NAME="Github Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F78166"           # Red (Syntax string)
export COLOR_03="#56D364"           # Green (Command)
export COLOR_04="#E3B341"           # Yellow (Command second)
export COLOR_05="#6CA4F8"           # Blue (Path)
export COLOR_06="#DB61A2"           # Magenta (Syntax var)
export COLOR_07="#2B7489"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#4D4D4D"           # Bright Black
export COLOR_10="#F78166"           # Bright Red (Command error)
export COLOR_11="#56D364"           # Bright Green (Exec)
export COLOR_12="#E3B341"           # Bright Yellow
export COLOR_13="#6CA4F8"           # Bright Blue (Folder)
export COLOR_14="#DB61A2"           # Bright Magenta
export COLOR_15="#2B7489"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#101216"   # Background
export FOREGROUND_COLOR="#8B949E"   # Foreground (Text)

export CURSOR_COLOR="#C9D1D9" # Cursor

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
