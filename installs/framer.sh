#!/usr/bin/env bash

export PROFILE_NAME="Framer"

export COLOR_01="#141414"           # Black (Host)
export COLOR_02="#FF5555"           # Red (Syntax string)
export COLOR_03="#98EC65"           # Green (Command)
export COLOR_04="#FFCC33"           # Yellow (Command second)
export COLOR_05="#00AAFF"           # Blue (Path)
export COLOR_06="#AA88FF"           # Magenta (Syntax var)
export COLOR_07="#88DDFF"           # Cyan (Prompt)
export COLOR_08="#CCCCCC"           # White

export COLOR_09="#414141"           # Bright Black
export COLOR_10="#FF8888"           # Bright Red (Command error)
export COLOR_11="#B6F292"           # Bright Green (Exec)
export COLOR_12="#FFD966"           # Bright Yellow
export COLOR_13="#33BBFF"           # Bright Blue (Folder)
export COLOR_14="#CEBBFF"           # Bright Magenta
export COLOR_15="#BBECFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#111111"   # Background
export FOREGROUND_COLOR="#777777"   # Foreground (Text)

export CURSOR_COLOR="#FCDC08" # Cursor

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
