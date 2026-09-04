#!/usr/bin/env bash

export PROFILE_NAME="Hardhacker"

export COLOR_01="#211E2A"           # Black (Host)
export COLOR_02="#E965A5"           # Red (Syntax string)
export COLOR_03="#B1F2A7"           # Green (Command)
export COLOR_04="#EBDE76"           # Yellow (Command second)
export COLOR_05="#95A6F4"           # Blue (Path)
export COLOR_06="#FF79C6"           # Magenta (Syntax var)
export COLOR_07="#B3F4F3"           # Cyan (Prompt)
export COLOR_08="#E4DEE9"           # White

export COLOR_09="#6E6780"           # Bright Black
export COLOR_10="#E965A5"           # Bright Red (Command error)
export COLOR_11="#B1F2A7"           # Bright Green (Exec)
export COLOR_12="#EBDE76"           # Bright Yellow
export COLOR_13="#95A6F4"           # Bright Blue (Folder)
export COLOR_14="#FF79C6"           # Bright Magenta
export COLOR_15="#B3F4F3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#211E2A"   # Background
export FOREGROUND_COLOR="#E4DEE9"   # Foreground (Text)

export CURSOR_COLOR="#E4DEE9" # Cursor

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
