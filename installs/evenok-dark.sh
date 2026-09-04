#!/usr/bin/env bash

export PROFILE_NAME="Evenok Dark"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#F5708A"           # Red (Syntax string)
export COLOR_03="#54BC5C"           # Green (Command)
export COLOR_04="#B8A300"           # Yellow (Command second)
export COLOR_05="#00AFF2"           # Blue (Path)
export COLOR_06="#9095FF"           # Magenta (Syntax var)
export COLOR_07="#00BAB3"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#F5708A"           # Bright Red (Command error)
export COLOR_11="#54BC5C"           # Bright Green (Exec)
export COLOR_12="#B8A300"           # Bright Yellow
export COLOR_13="#00AFF2"           # Bright Blue (Folder)
export COLOR_14="#9095FF"           # Bright Magenta
export COLOR_15="#00BAB3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
