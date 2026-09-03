#!/usr/bin/env bash

export PROFILE_NAME="Cursor Light"

export COLOR_01="#252525"           # Black (Host)
export COLOR_02="#CF2D56"           # Red (Syntax string)
export COLOR_03="#1F8A65"           # Green (Command)
export COLOR_04="#A16900"           # Yellow (Command second)
export COLOR_05="#3C7CAB"           # Blue (Path)
export COLOR_06="#B8448B"           # Magenta (Syntax var)
export COLOR_07="#4C7F8C"           # Cyan (Prompt)
export COLOR_08="#AFAFAF"           # White

export COLOR_09="#5C5C5C"           # Bright Black
export COLOR_10="#E75E78"           # Bright Red (Command error)
export COLOR_11="#55A583"           # Bright Green (Exec)
export COLOR_12="#C08532"           # Bright Yellow
export COLOR_13="#6299C3"           # Bright Blue (Folder)
export COLOR_14="#D06BA6"           # Bright Magenta
export COLOR_15="#6F9BA6"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#F3F3F3"   # Background
export FOREGROUND_COLOR="#252525"   # Foreground (Text)

export CURSOR_COLOR="#252525" # Cursor

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
