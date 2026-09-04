#!/usr/bin/env bash

export PROFILE_NAME="Tinta"

export COLOR_01="#101012"           # Black (Host)
export COLOR_02="#D0726A"           # Red (Syntax string)
export COLOR_03="#9AA890"           # Green (Command)
export COLOR_04="#C8B86A"           # Yellow (Command second)
export COLOR_05="#8A9AB0"           # Blue (Path)
export COLOR_06="#B0A0B8"           # Magenta (Syntax var)
export COLOR_07="#80B8B4"           # Cyan (Prompt)
export COLOR_08="#D8D6D0"           # White

export COLOR_09="#62626A"           # Bright Black
export COLOR_10="#D0726A"           # Bright Red (Command error)
export COLOR_11="#9AA890"           # Bright Green (Exec)
export COLOR_12="#C8B86A"           # Bright Yellow
export COLOR_13="#8A9AB0"           # Bright Blue (Folder)
export COLOR_14="#B0A0B8"           # Bright Magenta
export COLOR_15="#80B8B4"           # Bright Cyan
export COLOR_16="#EEECE6"           # Bright White

export BACKGROUND_COLOR="#101012"   # Background
export FOREGROUND_COLOR="#D8D6D0"   # Foreground (Text)

export CURSOR_COLOR="#D8D6D0" # Cursor

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
