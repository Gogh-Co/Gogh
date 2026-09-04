#!/usr/bin/env bash

export PROFILE_NAME="Sandcastle"

export COLOR_01="#282C34"           # Black (Host)
export COLOR_02="#83A598"           # Red (Syntax string)
export COLOR_03="#528B8B"           # Green (Command)
export COLOR_04="#A07E3B"           # Yellow (Command second)
export COLOR_05="#83A598"           # Blue (Path)
export COLOR_06="#D75F5F"           # Magenta (Syntax var)
export COLOR_07="#83A598"           # Cyan (Prompt)
export COLOR_08="#A89984"           # White

export COLOR_09="#665C54"           # Bright Black
export COLOR_10="#83A598"           # Bright Red (Command error)
export COLOR_11="#528B8B"           # Bright Green (Exec)
export COLOR_12="#A07E3B"           # Bright Yellow
export COLOR_13="#83A598"           # Bright Blue (Folder)
export COLOR_14="#D75F5F"           # Bright Magenta
export COLOR_15="#83A598"           # Bright Cyan
export COLOR_16="#FDF4C1"           # Bright White

export BACKGROUND_COLOR="#282C34"   # Background
export FOREGROUND_COLOR="#A89984"   # Foreground (Text)

export CURSOR_COLOR="#A89984" # Cursor

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
