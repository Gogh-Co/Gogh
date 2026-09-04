#!/usr/bin/env bash

export PROFILE_NAME="Neovim Dark"

export COLOR_01="#14161B"           # Black (Host)
export COLOR_02="#FFC0B9"           # Red (Syntax string)
export COLOR_03="#B3F6C0"           # Green (Command)
export COLOR_04="#FCE094"           # Yellow (Command second)
export COLOR_05="#A6DBFF"           # Blue (Path)
export COLOR_06="#FFCAFF"           # Magenta (Syntax var)
export COLOR_07="#8CF8F7"           # Cyan (Prompt)
export COLOR_08="#E0E2EA"           # White

export COLOR_09="#9B9EA4"           # Bright Black
export COLOR_10="#FFC0B9"           # Bright Red (Command error)
export COLOR_11="#B3F6C0"           # Bright Green (Exec)
export COLOR_12="#FCE094"           # Bright Yellow
export COLOR_13="#A6DBFF"           # Bright Blue (Folder)
export COLOR_14="#FFCAFF"           # Bright Magenta
export COLOR_15="#8CF8F7"           # Bright Cyan
export COLOR_16="#EEF1F8"           # Bright White

export BACKGROUND_COLOR="#14161B"   # Background
export FOREGROUND_COLOR="#E0E2EA"   # Foreground (Text)

export CURSOR_COLOR="#E0E2EA" # Cursor

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
