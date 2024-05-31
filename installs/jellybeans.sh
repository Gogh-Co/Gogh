#!/usr/bin/env bash

export PROFILE_NAME="Jellybeans"

export COLOR_01="#929292"           # Black (Host)
export COLOR_02="#E27373"           # Red (Syntax string)
export COLOR_03="#94B979"           # Green (Command)
export COLOR_04="#FFBA7B"           # Yellow (Command second)
export COLOR_05="#97BEDC"           # Blue (Path)
export COLOR_06="#E1C0FA"           # Magenta (Syntax var)
export COLOR_07="#00988E"           # Cyan (Prompt)
export COLOR_08="#DEDEDE"           # White

export COLOR_09="#BDBDBD"           # Bright Black
export COLOR_10="#FFA1A1"           # Bright Red (Command error)
export COLOR_11="#BDDEAB"           # Bright Green (Exec)
export COLOR_12="#FFDCA0"           # Bright Yellow
export COLOR_13="#B1D8F6"           # Bright Blue (Folder)
export COLOR_14="#FBDAFF"           # Bright Magenta
export COLOR_15="#1AB2A8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#121212"   # Background
export FOREGROUND_COLOR="#DEDEDE"   # Foreground (Text)

export CURSOR_COLOR="#DEDEDE" # Cursor

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
