#!/usr/bin/env bash

export PROFILE_NAME="Material Theme Mod"

export COLOR_01="#666666"           # Black (Host)
export COLOR_02="#EB606B"           # Red (Syntax string)
export COLOR_03="#C3E88D"           # Green (Command)
export COLOR_04="#F7EB95"           # Yellow (Command second)
export COLOR_05="#80CBC4"           # Blue (Path)
export COLOR_06="#FF2F90"           # Magenta (Syntax var)
export COLOR_07="#AEDDFF"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#A1A1A1"           # Bright Black
export COLOR_10="#EB606B"           # Bright Red (Command error)
export COLOR_11="#C3E88D"           # Bright Green (Exec)
export COLOR_12="#F7EB95"           # Bright Yellow
export COLOR_13="#7DC6BF"           # Bright Blue (Folder)
export COLOR_14="#6C71C4"           # Bright Magenta
export COLOR_15="#35434D"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1E282D"   # Background
export FOREGROUND_COLOR="#C4C7D1"   # Foreground (Text)

export CURSOR_COLOR="#C4C7D1" # Cursor

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
