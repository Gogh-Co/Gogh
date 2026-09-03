#!/usr/bin/env bash

export PROFILE_NAME="Seoulbones Dark"

export COLOR_01="#4B4B4B"           # Black (Host)
export COLOR_02="#E388A3"           # Red (Syntax string)
export COLOR_03="#98BD99"           # Green (Command)
export COLOR_04="#FFDF9B"           # Yellow (Command second)
export COLOR_05="#97BDDE"           # Blue (Path)
export COLOR_06="#A5A6C5"           # Magenta (Syntax var)
export COLOR_07="#6FBDBE"           # Cyan (Prompt)
export COLOR_08="#DDDDDD"           # White

export COLOR_09="#6C6465"           # Bright Black
export COLOR_10="#EB99B1"           # Bright Red (Command error)
export COLOR_11="#8FCD92"           # Bright Green (Exec)
export COLOR_12="#FFE5B3"           # Bright Yellow
export COLOR_13="#A2C8E9"           # Bright Blue (Folder)
export COLOR_14="#B2B3DA"           # Bright Magenta
export COLOR_15="#6BCACB"           # Bright Cyan
export COLOR_16="#A8A8A8"           # Bright White

export BACKGROUND_COLOR="#4B4B4B"   # Background
export FOREGROUND_COLOR="#DDDDDD"   # Foreground (Text)

export CURSOR_COLOR="#E2E2E2" # Cursor

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
