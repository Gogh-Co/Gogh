#!/usr/bin/env bash

export PROFILE_NAME="Ibm 3270 (High Contrast)"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FF0000"           # Red (Syntax string)
export COLOR_03="#00FF00"           # Green (Command)
export COLOR_04="#FFFF00"           # Yellow (Command second)
export COLOR_05="#00BFFF"           # Blue (Path)
export COLOR_06="#FFC0CB"           # Magenta (Syntax var)
export COLOR_07="#40E0D0"           # Cyan (Prompt)
export COLOR_08="#BEBEBE"           # White

export COLOR_09="#414141"           # Bright Black
export COLOR_10="#FFA500"           # Bright Red (Command error)
export COLOR_11="#98FB98"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#0000CD"           # Bright Blue (Folder)
export COLOR_14="#A020F0"           # Bright Magenta
export COLOR_15="#AEEEEE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#FDFDFD"   # Foreground (Text)

export CURSOR_COLOR="#FDFDFD" # Cursor

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
