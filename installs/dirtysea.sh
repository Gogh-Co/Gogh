#!/usr/bin/env bash

export PROFILE_NAME="Dirtysea"

export COLOR_01="#E0E0E0"           # Black (Host)
export COLOR_02="#840000"           # Red (Syntax string)
export COLOR_03="#730073"           # Green (Command)
export COLOR_04="#755B00"           # Yellow (Command second)
export COLOR_05="#007300"           # Blue (Path)
export COLOR_06="#000090"           # Magenta (Syntax var)
export COLOR_07="#755B00"           # Cyan (Prompt)
export COLOR_08="#000000"           # White

export COLOR_09="#707070"           # Bright Black
export COLOR_10="#840000"           # Bright Red (Command error)
export COLOR_11="#730073"           # Bright Green (Exec)
export COLOR_12="#755B00"           # Bright Yellow
export COLOR_13="#007300"           # Bright Blue (Folder)
export COLOR_14="#000090"           # Bright Magenta
export COLOR_15="#755B00"           # Bright Cyan
export COLOR_16="#C4D9C4"           # Bright White

export BACKGROUND_COLOR="#E0E0E0"   # Background
export FOREGROUND_COLOR="#000000"   # Foreground (Text)

export CURSOR_COLOR="#000000" # Cursor

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
