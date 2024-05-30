#!/usr/bin/env bash

export PROFILE_NAME="Ayu Mirage"

export COLOR_01="#1F2430"           # Black (Host)
export COLOR_02="#FF3333"           # Red (Syntax string)
export COLOR_03="#BAE67E"           # Green (Command)
export COLOR_04="#FFA759"           # Yellow (Command second)
export COLOR_05="#73D0FF"           # Blue (Path)
export COLOR_06="#D4BFFF"           # Magenta (Syntax var)
export COLOR_07="#95E6CB"           # Cyan (Prompt)
export COLOR_08="#CBCCC6"           # White

export COLOR_09="#707A8C"           # Bright Black
export COLOR_10="#FF3333"           # Bright Red (Command error)
export COLOR_11="#BAE67E"           # Bright Green (Exec)
export COLOR_12="#FFA759"           # Bright Yellow
export COLOR_13="#73D0FF"           # Bright Blue (Folder)
export COLOR_14="#D4BFFF"           # Bright Magenta
export COLOR_15="#95E6CB"           # Bright Cyan
export COLOR_16="#CBCCC6"           # Bright White

export BACKGROUND_COLOR="#1F2430"   # Background
export FOREGROUND_COLOR="#CBCCC6"   # Foreground (Text)

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
