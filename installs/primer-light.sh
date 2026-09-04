#!/usr/bin/env bash

export PROFILE_NAME="Primer Light"

export COLOR_01="#FAFBFC"           # Black (Host)
export COLOR_02="#D73A49"           # Red (Syntax string)
export COLOR_03="#28A745"           # Green (Command)
export COLOR_04="#FFD33D"           # Yellow (Command second)
export COLOR_05="#0366D6"           # Blue (Path)
export COLOR_06="#EA4AAA"           # Magenta (Syntax var)
export COLOR_07="#79B8FF"           # Cyan (Prompt)
export COLOR_08="#2F363D"           # White

export COLOR_09="#959DA5"           # Bright Black
export COLOR_10="#D73A49"           # Bright Red (Command error)
export COLOR_11="#28A745"           # Bright Green (Exec)
export COLOR_12="#FFD33D"           # Bright Yellow
export COLOR_13="#0366D6"           # Bright Blue (Folder)
export COLOR_14="#EA4AAA"           # Bright Magenta
export COLOR_15="#79B8FF"           # Bright Cyan
export COLOR_16="#1B1F23"           # Bright White

export BACKGROUND_COLOR="#FAFBFC"   # Background
export FOREGROUND_COLOR="#2F363D"   # Foreground (Text)

export CURSOR_COLOR="#2F363D" # Cursor

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
