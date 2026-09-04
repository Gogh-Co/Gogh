#!/usr/bin/env bash

export PROFILE_NAME="Linh"

export COLOR_01="#555555"           # Black (Host)
export COLOR_02="#C56360"           # Red (Syntax string)
export COLOR_03="#599B5C"           # Green (Command)
export COLOR_04="#B2B05B"           # Yellow (Command second)
export COLOR_05="#B26CB7"           # Blue (Path)
export COLOR_06="#7D7EB3"           # Magenta (Syntax var)
export COLOR_07="#50BBBC"           # Cyan (Prompt)
export COLOR_08="#D6D6D6"           # White

export COLOR_09="#717171"           # Bright Black
export COLOR_10="#E95752"           # Bright Red (Command error)
export COLOR_11="#49AE4D"           # Bright Green (Exec)
export COLOR_12="#D8D54F"           # Bright Yellow
export COLOR_13="#CE70D4"           # Bright Blue (Folder)
export COLOR_14="#7374CA"           # Bright Magenta
export COLOR_15="#57DCDD"           # Bright Cyan
export COLOR_16="#F3F4F4"           # Bright White

export BACKGROUND_COLOR="#232323"   # Background
export FOREGROUND_COLOR="#6EBEFE"   # Foreground (Text)

export CURSOR_COLOR="#6EBEFE" # Cursor

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
