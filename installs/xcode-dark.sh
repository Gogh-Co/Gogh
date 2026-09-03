#!/usr/bin/env bash

export PROFILE_NAME="Xcode Dark"

export COLOR_01="#414453"           # Black (Host)
export COLOR_02="#FF8170"           # Red (Syntax string)
export COLOR_03="#78C2B3"           # Green (Command)
export COLOR_04="#D9C97C"           # Yellow (Command second)
export COLOR_05="#4EB0CC"           # Blue (Path)
export COLOR_06="#FF7AB2"           # Magenta (Syntax var)
export COLOR_07="#B281EB"           # Cyan (Prompt)
export COLOR_08="#DFDFE0"           # White

export COLOR_09="#7F8C98"           # Bright Black
export COLOR_10="#FF8170"           # Bright Red (Command error)
export COLOR_11="#ACF2E4"           # Bright Green (Exec)
export COLOR_12="#FFA14F"           # Bright Yellow
export COLOR_13="#6BDFFF"           # Bright Blue (Folder)
export COLOR_14="#FF7AB2"           # Bright Magenta
export COLOR_15="#DABAFF"           # Bright Cyan
export COLOR_16="#DFDFE0"           # Bright White

export BACKGROUND_COLOR="#292A30"   # Background
export FOREGROUND_COLOR="#DFDFE0"   # Foreground (Text)

export CURSOR_COLOR="#DFDFE0" # Cursor

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
