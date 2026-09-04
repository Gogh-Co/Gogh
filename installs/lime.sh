#!/usr/bin/env bash

export PROFILE_NAME="Lime"

export COLOR_01="#1A1A2F"           # Black (Host)
export COLOR_02="#FF662A"           # Red (Syntax string)
export COLOR_03="#8CD97C"           # Green (Command)
export COLOR_04="#FFD15E"           # Yellow (Command second)
export COLOR_05="#2B926F"           # Blue (Path)
export COLOR_06="#1B825F"           # Magenta (Syntax var)
export COLOR_07="#4CAD83"           # Cyan (Prompt)
export COLOR_08="#818175"           # White

export COLOR_09="#313140"           # Bright Black
export COLOR_10="#FF662A"           # Bright Red (Command error)
export COLOR_11="#8CD97C"           # Bright Green (Exec)
export COLOR_12="#FFD15E"           # Bright Yellow
export COLOR_13="#2B926F"           # Bright Blue (Folder)
export COLOR_14="#1B825F"           # Bright Magenta
export COLOR_15="#4CAD83"           # Bright Cyan
export COLOR_16="#FFF8E1"           # Bright White

export BACKGROUND_COLOR="#1A1A2F"   # Background
export FOREGROUND_COLOR="#818175"   # Foreground (Text)

export CURSOR_COLOR="#818175" # Cursor

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
