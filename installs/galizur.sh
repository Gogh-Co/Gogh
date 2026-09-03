#!/usr/bin/env bash

export PROFILE_NAME="Galizur"

export COLOR_01="#223344"           # Black (Host)
export COLOR_02="#AA1122"           # Red (Syntax string)
export COLOR_03="#33AA11"           # Green (Command)
export COLOR_04="#CCAA22"           # Yellow (Command second)
export COLOR_05="#2255CC"           # Blue (Path)
export COLOR_06="#7755AA"           # Magenta (Syntax var)
export COLOR_07="#22BBDD"           # Cyan (Prompt)
export COLOR_08="#8899AA"           # White

export COLOR_09="#556677"           # Bright Black
export COLOR_10="#FF1133"           # Bright Red (Command error)
export COLOR_11="#33FF11"           # Bright Green (Exec)
export COLOR_12="#FFDD33"           # Bright Yellow
export COLOR_13="#3377FF"           # Bright Blue (Folder)
export COLOR_14="#AA77FF"           # Bright Magenta
export COLOR_15="#33DDFF"           # Bright Cyan
export COLOR_16="#BBCCDD"           # Bright White

export BACKGROUND_COLOR="#071317"   # Background
export FOREGROUND_COLOR="#DDEEFF"   # Foreground (Text)

export CURSOR_COLOR="#DDEEFF" # Cursor

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
