#!/usr/bin/env bash

export PROFILE_NAME="Seoul256"

export COLOR_01="#4e4e4e"           # Black (Host)
export COLOR_02="#d68787"           # Red (Syntax string)
export COLOR_03="#5f865f"           # Green (Command)
export COLOR_04="#d8af5f"           # Yellow (Command second)
export COLOR_05="#85add4"           # Blue (Path)
export COLOR_06="#d7afaf"           # Magenta (Syntax var)
export COLOR_07="#87afaf"           # Cyan (Prompt)
export COLOR_08="#d0d0d0"           # White

export COLOR_09="#626262"           # Bright Black
export COLOR_10="#d75f87"           # Bright Red (Command error)
export COLOR_11="#87af87"           # Bright Green (Exec)
export COLOR_12="#ffd787"           # Bright Yellow
export COLOR_13="#add4fb"           # Bright Blue (Folder)
export COLOR_14="#ffafaf"           # Bright Magenta
export COLOR_15="#87d7d7"           # Bright Cyan
export COLOR_16="#e4e4e4"           # Bright White

export BACKGROUND_COLOR="#3a3a3a"   # Background
export FOREGROUND_COLOR="#d0d0d0"   # Foreground (Text)

export CURSOR_COLOR="#d0d0d0" # Cursor

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
