#!/usr/bin/env bash

export PROFILE_NAME="Smyck"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#B84131"           # Red (Syntax string)
export COLOR_03="#7DA900"           # Green (Command)
export COLOR_04="#C4A500"           # Yellow (Command second)
export COLOR_05="#62A3C4"           # Blue (Path)
export COLOR_06="#BA8ACC"           # Magenta (Syntax var)
export COLOR_07="#207383"           # Cyan (Prompt)
export COLOR_08="#A1A1A1"           # White

export COLOR_09="#7A7A7A"           # Bright Black
export COLOR_10="#D6837C"           # Bright Red (Command error)
export COLOR_11="#C4F137"           # Bright Green (Exec)
export COLOR_12="#FEE14D"           # Bright Yellow
export COLOR_13="#8DCFF0"           # Bright Blue (Folder)
export COLOR_14="#F79AFF"           # Bright Magenta
export COLOR_15="#6AD9CF"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#1B1B1B"   # Background
export FOREGROUND_COLOR="#F7F7F7"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
