#!/usr/bin/env bash

export PROFILE_NAME="Cobalt Neon"

export COLOR_01="#142631"           # Black (Host)
export COLOR_02="#FF2320"           # Red (Syntax string)
export COLOR_03="#3BA5FF"           # Green (Command)
export COLOR_04="#E9E75C"           # Yellow (Command second)
export COLOR_05="#8FF586"           # Blue (Path)
export COLOR_06="#781AA0"           # Magenta (Syntax var)
export COLOR_07="#8FF586"           # Cyan (Prompt)
export COLOR_08="#BA46B2"           # White

export COLOR_09="#FFF688"           # Bright Black
export COLOR_10="#D4312E"           # Bright Red (Command error)
export COLOR_11="#8FF586"           # Bright Green (Exec)
export COLOR_12="#E9F06D"           # Bright Yellow
export COLOR_13="#3C7DD2"           # Bright Blue (Folder)
export COLOR_14="#8230A7"           # Bright Magenta
export COLOR_15="#6CBC67"           # Bright Cyan
export COLOR_16="#8FF586"           # Bright White

export BACKGROUND_COLOR="#142838"   # Background
export FOREGROUND_COLOR="#8FF586"   # Foreground (Text)

export CURSOR_COLOR="#8FF586" # Cursor

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
