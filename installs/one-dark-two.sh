#!/usr/bin/env bash

export PROFILE_NAME="One Dark Two"

export COLOR_01="#1D1F23"           # Black (Host)
export COLOR_02="#E27881"           # Red (Syntax string)
export COLOR_03="#98C379"           # Green (Command)
export COLOR_04="#EAC786"           # Yellow (Command second)
export COLOR_05="#71B9F4"           # Blue (Path)
export COLOR_06="#C88BDA"           # Magenta (Syntax var)
export COLOR_07="#62BAC6"           # Cyan (Prompt)
export COLOR_08="#C9CCD3"           # White

export COLOR_09="#4A505A"           # Bright Black
export COLOR_10="#E68991"           # Bright Red (Command error)
export COLOR_11="#A8CC8E"           # Bright Green (Exec)
export COLOR_12="#EDCF97"           # Bright Yellow
export COLOR_13="#8DC7F6"           # Bright Blue (Folder)
export COLOR_14="#D3A2E2"           # Bright Magenta
export COLOR_15="#78C4CE"           # Bright Cyan
export COLOR_16="#E6E6E6"           # Bright White

export BACKGROUND_COLOR="#21252B"   # Background
export FOREGROUND_COLOR="#E6E6E6"   # Foreground (Text)

export CURSOR_COLOR="#E6E6E6" # Cursor

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
