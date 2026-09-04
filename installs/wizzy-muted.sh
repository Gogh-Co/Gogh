#!/usr/bin/env bash

export PROFILE_NAME="Wizzy Muted"

export COLOR_01="#444444"           # Black (Host)
export COLOR_02="#9D5776"           # Red (Syntax string)
export COLOR_03="#398484"           # Green (Command)
export COLOR_04="#6B6B88"           # Yellow (Command second)
export COLOR_05="#4A6684"           # Blue (Path)
export COLOR_06="#6F579D"           # Magenta (Syntax var)
export COLOR_07="#42769D"           # Cyan (Prompt)
export COLOR_08="#9AADB2"           # White

export COLOR_09="#4E4E4E"           # Bright Black
export COLOR_10="#CF5E91"           # Bright Red (Command error)
export COLOR_11="#64B7B7"           # Bright Green (Exec)
export COLOR_12="#8D8DBA"           # Bright Yellow
export COLOR_13="#588BC4"           # Bright Blue (Folder)
export COLOR_14="#8F73C4"           # Bright Magenta
export COLOR_15="#71A7CF"           # Bright Cyan
export COLOR_16="#D1D1D1"           # Bright White

export BACKGROUND_COLOR="#100814"   # Background
export FOREGROUND_COLOR="#B2B8C4"   # Foreground (Text)

export CURSOR_COLOR="#B2B8C4" # Cursor

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
