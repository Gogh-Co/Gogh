#!/usr/bin/env bash

export PROFILE_NAME="Dumbledore"

export COLOR_01="#2B283D"           # Black (Host)
export COLOR_02="#AE0000"           # Red (Syntax string)
export COLOR_03="#3E7C54"           # Green (Command)
export COLOR_04="#F0C75E"           # Yellow (Command second)
export COLOR_05="#415BAF"           # Blue (Path)
export COLOR_06="#9445AE"           # Magenta (Syntax var)
export COLOR_07="#008AFF"           # Cyan (Prompt)
export COLOR_08="#850000"           # White

export COLOR_09="#413E53"           # Bright Black
export COLOR_10="#D3A624"           # Bright Red (Command error)
export COLOR_11="#AAAAAA"           # Bright Green (Exec)
export COLOR_12="#716254"           # Bright Yellow
export COLOR_13="#946A2C"           # Bright Blue (Folder)
export COLOR_14="#B294BA"           # Bright Magenta
export COLOR_15="#25DE50"           # Bright Cyan
export COLOR_16="#C9C9C9"           # Bright White

export BACKGROUND_COLOR="#422553"   # Background
export FOREGROUND_COLOR="#C4C8C5"   # Foreground (Text)

export CURSOR_COLOR="#C4C8C5" # Cursor

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
