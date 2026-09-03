#!/usr/bin/env bash

export PROFILE_NAME="Website"

export COLOR_01="#183C44"           # Black (Host)
export COLOR_02="#DA4949"           # Red (Syntax string)
export COLOR_03="#BCCA15"           # Green (Command)
export COLOR_04="#FFB02E"           # Yellow (Command second)
export COLOR_05="#35A6E6"           # Blue (Path)
export COLOR_06="#D343A2"           # Magenta (Syntax var)
export COLOR_07="#38C995"           # Cyan (Prompt)
export COLOR_08="#FFE8C1"           # White

export COLOR_09="#235662"           # Bright Black
export COLOR_10="#FF5757"           # Bright Red (Command error)
export COLOR_11="#ECFF14"           # Bright Green (Exec)
export COLOR_12="#FFD694"           # Bright Yellow
export COLOR_13="#4CBFFF"           # Bright Blue (Folder)
export COLOR_14="#FF4CC2"           # Bright Magenta
export COLOR_15="#35FFB6"           # Bright Cyan
export COLOR_16="#FFD48F"           # Bright White

export BACKGROUND_COLOR="#132F35"   # Background
export FOREGROUND_COLOR="#D1B890"   # Foreground (Text)

export CURSOR_COLOR="#D1B890" # Cursor

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
