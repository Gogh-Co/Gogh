#!/usr/bin/env bash

export PROFILE_NAME="Aardvark Blue"

export COLOR_01="#191919"           # Black (Host)
export COLOR_02="#AA342E"           # Red (Syntax string)
export COLOR_03="#4B8C0F"           # Green (Command)
export COLOR_04="#DBBA00"           # Yellow (Command second)
export COLOR_05="#1370D3"           # Blue (Path)
export COLOR_06="#C43AC3"           # Magenta (Syntax var)
export COLOR_07="#008EB0"           # Cyan (Prompt)
export COLOR_08="#BEBEBE"           # White

export COLOR_09="#454545"           # Bright Black
export COLOR_10="#F05B50"           # Bright Red (Command error)
export COLOR_11="#95DC55"           # Bright Green (Exec)
export COLOR_12="#FFE763"           # Bright Yellow
export COLOR_13="#60A4EC"           # Bright Blue (Folder)
export COLOR_14="#E26BE2"           # Bright Magenta
export COLOR_15="#60B6CB"           # Bright Cyan
export COLOR_16="#F7F7F7"           # Bright White

export BACKGROUND_COLOR="#102040"   # Background
export FOREGROUND_COLOR="#DDDDDD"   # Foreground (Text)

export CURSOR_COLOR="#007ACC" # Cursor

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
