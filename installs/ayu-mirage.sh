#!/usr/bin/env bash

export PROFILE_NAME="Ayu Mirage"

export COLOR_01="#171B24"           # Black (Host)
export COLOR_02="#ED8274"           # Red (Syntax string)
export COLOR_03="#87D96C"           # Green (Command)
export COLOR_04="#FACC6E"           # Yellow (Command second)
export COLOR_05="#6DCBFA"           # Blue (Path)
export COLOR_06="#DABAFA"           # Magenta (Syntax var)
export COLOR_07="#90E1C6"           # Cyan (Prompt)
export COLOR_08="#C7C7C7"           # White

export COLOR_09="#686868"           # Bright Black
export COLOR_10="#F28779"           # Bright Red (Command error)
export COLOR_11="#D5FF80"           # Bright Green (Exec)
export COLOR_12="#FFD173"           # Bright Yellow
export COLOR_13="#73D0FF"           # Bright Blue (Folder)
export COLOR_14="#DFBFFF"           # Bright Magenta
export COLOR_15="#95E6CB"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1F2430"   # Background
export FOREGROUND_COLOR="#CCCAC2"   # Foreground (Text)

export CURSOR_COLOR="#FFCC66" # Cursor

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
