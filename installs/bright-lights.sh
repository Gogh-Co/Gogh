#!/usr/bin/env bash

export PROFILE_NAME="Bright Lights"

export COLOR_01="#191919"           # Black (Host)
export COLOR_02="#FF355B"           # Red (Syntax string)
export COLOR_03="#B7E876"           # Green (Command)
export COLOR_04="#FFC251"           # Yellow (Command second)
export COLOR_05="#76D4FF"           # Blue (Path)
export COLOR_06="#BA76E7"           # Magenta (Syntax var)
export COLOR_07="#6CBFB5"           # Cyan (Prompt)
export COLOR_08="#C2C8D7"           # White

export COLOR_09="#191919"           # Bright Black
export COLOR_10="#FF355B"           # Bright Red (Command error)
export COLOR_11="#B7E876"           # Bright Green (Exec)
export COLOR_12="#FFC251"           # Bright Yellow
export COLOR_13="#76D5FF"           # Bright Blue (Folder)
export COLOR_14="#BA76E7"           # Bright Magenta
export COLOR_15="#6CBFB5"           # Bright Cyan
export COLOR_16="#C2C8D7"           # Bright White

export BACKGROUND_COLOR="#191919"   # Background
export FOREGROUND_COLOR="#B3C9D7"   # Foreground (Text)

export CURSOR_COLOR="#F34B00" # Cursor

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
