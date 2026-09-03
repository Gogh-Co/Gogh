#!/usr/bin/env bash

export PROFILE_NAME="Nightfox"

export COLOR_01="#393B44"           # Black (Host)
export COLOR_02="#C94F6D"           # Red (Syntax string)
export COLOR_03="#81B29A"           # Green (Command)
export COLOR_04="#DBC074"           # Yellow (Command second)
export COLOR_05="#719CD6"           # Blue (Path)
export COLOR_06="#9D79D6"           # Magenta (Syntax var)
export COLOR_07="#63CDCF"           # Cyan (Prompt)
export COLOR_08="#DFDFE0"           # White

export COLOR_09="#575860"           # Bright Black
export COLOR_10="#D16983"           # Bright Red (Command error)
export COLOR_11="#8EBAA4"           # Bright Green (Exec)
export COLOR_12="#E0C989"           # Bright Yellow
export COLOR_13="#86ABDC"           # Bright Blue (Folder)
export COLOR_14="#BAA1E2"           # Bright Magenta
export COLOR_15="#7AD5D6"           # Bright Cyan
export COLOR_16="#E4E4E5"           # Bright White

export BACKGROUND_COLOR="#192330"   # Background
export FOREGROUND_COLOR="#CDCECF"   # Foreground (Text)

export CURSOR_COLOR="#CDCECF" # Cursor

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
