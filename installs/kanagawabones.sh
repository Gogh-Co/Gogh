#!/usr/bin/env bash

export PROFILE_NAME="Kanagawabones"

export COLOR_01="#1F1F28"           # Black (Host)
export COLOR_02="#E46A78"           # Red (Syntax string)
export COLOR_03="#98BC6D"           # Green (Command)
export COLOR_04="#E5C283"           # Yellow (Command second)
export COLOR_05="#7EB3C9"           # Blue (Path)
export COLOR_06="#957FB8"           # Magenta (Syntax var)
export COLOR_07="#7EB3C9"           # Cyan (Prompt)
export COLOR_08="#DDD8BB"           # White

export COLOR_09="#3C3C51"           # Bright Black
export COLOR_10="#EC818C"           # Bright Red (Command error)
export COLOR_11="#9EC967"           # Bright Green (Exec)
export COLOR_12="#F1C982"           # Bright Yellow
export COLOR_13="#7BC2DF"           # Bright Blue (Folder)
export COLOR_14="#A98FD2"           # Bright Magenta
export COLOR_15="#7BC2DF"           # Bright Cyan
export COLOR_16="#A8A48D"           # Bright White

export BACKGROUND_COLOR="#1F1F28"   # Background
export FOREGROUND_COLOR="#DDD8BB"   # Foreground (Text)

export CURSOR_COLOR="#E6E0C2" # Cursor

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
