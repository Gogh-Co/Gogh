#!/usr/bin/env bash

export PROFILE_NAME="Railscasts"

export COLOR_01="#2B2B2B"           # Black (Host)
export COLOR_02="#DA4939"           # Red (Syntax string)
export COLOR_03="#A5C261"           # Green (Command)
export COLOR_04="#FFC66D"           # Yellow (Command second)
export COLOR_05="#6D9CBE"           # Blue (Path)
export COLOR_06="#B6B3EB"           # Magenta (Syntax var)
export COLOR_07="#519F50"           # Cyan (Prompt)
export COLOR_08="#E6E1DC"           # White

export COLOR_09="#5A647E"           # Bright Black
export COLOR_10="#DA4939"           # Bright Red (Command error)
export COLOR_11="#A5C261"           # Bright Green (Exec)
export COLOR_12="#FFC66D"           # Bright Yellow
export COLOR_13="#6D9CBE"           # Bright Blue (Folder)
export COLOR_14="#B6B3EB"           # Bright Magenta
export COLOR_15="#519F50"           # Bright Cyan
export COLOR_16="#F9F7F3"           # Bright White

export BACKGROUND_COLOR="#2B2B2B"   # Background
export FOREGROUND_COLOR="#E6E1DC"   # Foreground (Text)

export CURSOR_COLOR="#E6E1DC" # Cursor

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
