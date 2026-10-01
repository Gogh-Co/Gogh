#!/usr/bin/env bash

export PROFILE_NAME="Sangdoist Light"

export COLOR_01="#131417"           # Black (Host)
export COLOR_02="#C4481A"           # Red (Syntax string)
export COLOR_03="#5E7E1A"           # Green (Command)
export COLOR_04="#9C7A08"           # Yellow (Command second)
export COLOR_05="#1F5FC4"           # Blue (Path)
export COLOR_06="#9A3F6C"           # Magenta (Syntax var)
export COLOR_07="#3A7F72"           # Cyan (Prompt)
export COLOR_08="#C8C8C4"           # White

export COLOR_09="#62627A"           # Bright Black
export COLOR_10="#B8300F"           # Bright Red (Command error)
export COLOR_11="#4A8A2C"           # Bright Green (Exec)
export COLOR_12="#B0901A"           # Bright Yellow
export COLOR_13="#3641CF"           # Bright Blue (Folder)
export COLOR_14="#B3407E"           # Bright Magenta
export COLOR_15="#55689A"           # Bright Cyan
export COLOR_16="#E7E7E4"           # Bright White

export BACKGROUND_COLOR="#F4F4F1"   # Background
export FOREGROUND_COLOR="#26272B"   # Foreground (Text)

export CURSOR_COLOR="#808080" # Cursor

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
