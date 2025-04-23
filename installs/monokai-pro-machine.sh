#!/usr/bin/env bash

export PROFILE_NAME="Monokai Pro Machine"

export COLOR_01="#273136"           # Black (Host)
export COLOR_02="#FF6D7E"           # Red (Syntax string)
export COLOR_03="#A2E57B"           # Green (Command)
export COLOR_04="#FFED72"           # Yellow (Command second)
export COLOR_05="#FFB270"           # Blue (Path)
export COLOR_06="#BAA0F8"           # Magenta (Syntax var)
export COLOR_07="#7CD5F1"           # Cyan (Prompt)
export COLOR_08="#F2FFFC"           # White

export COLOR_09="#ADB1B4"           # Bright Black
export COLOR_10="#FF6D7E"           # Bright Red (Command error)
export COLOR_11="#A2E57B"           # Bright Green (Exec)
export COLOR_12="#FFED72"           # Bright Yellow
export COLOR_13="#FFB270"           # Bright Blue (Folder)
export COLOR_14="#BAA0F8"           # Bright Magenta
export COLOR_15="#7CD5F1"           # Bright Cyan
export COLOR_16="#F2FFFC"           # Bright White

export BACKGROUND_COLOR="#273136"   # Background
export FOREGROUND_COLOR="#F2FFFC"   # Foreground (Text)

export CURSOR_COLOR="#F2FFFC" # Cursor

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
