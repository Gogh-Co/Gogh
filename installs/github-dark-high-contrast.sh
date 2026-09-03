#!/usr/bin/env bash

export PROFILE_NAME="GitHub Dark High Contrast"

export COLOR_01="#7A828E"           # Black (Host)
export COLOR_02="#FF9492"           # Red (Syntax string)
export COLOR_03="#26CD4D"           # Green (Command)
export COLOR_04="#F0B72F"           # Yellow (Command second)
export COLOR_05="#71B7FF"           # Blue (Path)
export COLOR_06="#CB9EFF"           # Magenta (Syntax var)
export COLOR_07="#39C5CF"           # Cyan (Prompt)
export COLOR_08="#D9DEE3"           # White

export COLOR_09="#9EA7B3"           # Bright Black
export COLOR_10="#FFB1AF"           # Bright Red (Command error)
export COLOR_11="#4AE168"           # Bright Green (Exec)
export COLOR_12="#F7C843"           # Bright Yellow
export COLOR_13="#91CBFF"           # Bright Blue (Folder)
export COLOR_14="#DBB7FF"           # Bright Magenta
export COLOR_15="#56D4DD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0A0C10"   # Background
export FOREGROUND_COLOR="#F0F3F6"   # Foreground (Text)

export CURSOR_COLOR="#71B7FF" # Cursor

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
