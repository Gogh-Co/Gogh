#!/usr/bin/env bash

export PROFILE_NAME="Tempus Winter"

export COLOR_01="#202427"           # Black (Host)
export COLOR_02="#ED6E5A"           # Red (Syntax string)
export COLOR_03="#4AA920"           # Green (Command)
export COLOR_04="#9A9921"           # Yellow (Command second)
export COLOR_05="#7B91DF"           # Blue (Path)
export COLOR_06="#D17E80"           # Magenta (Syntax var)
export COLOR_07="#4FA394"           # Cyan (Prompt)
export COLOR_08="#91959B"           # White

export COLOR_09="#2A2E38"           # Bright Black
export COLOR_10="#DE7B28"           # Bright Red (Command error)
export COLOR_11="#00AB5F"           # Bright Green (Exec)
export COLOR_12="#AF9155"           # Bright Yellow
export COLOR_13="#329FCB"           # Bright Blue (Folder)
export COLOR_14="#CA77C5"           # Bright Magenta
export COLOR_15="#1BA6A4"           # Bright Cyan
export COLOR_16="#8DA3B8"           # Bright White

export BACKGROUND_COLOR="#202427"   # Background
export FOREGROUND_COLOR="#8DA3B8"   # Foreground (Text)

export CURSOR_COLOR="#8DA3B8" # Cursor

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
