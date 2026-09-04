#!/usr/bin/env bash

export PROFILE_NAME="Silk Dark"

export COLOR_01="#0E3C46"           # Black (Host)
export COLOR_02="#FB6953"           # Red (Syntax string)
export COLOR_03="#73D8AD"           # Green (Command)
export COLOR_04="#FCE380"           # Yellow (Command second)
export COLOR_05="#46BDDD"           # Blue (Path)
export COLOR_06="#756B8A"           # Magenta (Syntax var)
export COLOR_07="#3FB2B9"           # Cyan (Prompt)
export COLOR_08="#C7DBDD"           # White

export COLOR_09="#587073"           # Bright Black
export COLOR_10="#FB6953"           # Bright Red (Command error)
export COLOR_11="#73D8AD"           # Bright Green (Exec)
export COLOR_12="#FCE380"           # Bright Yellow
export COLOR_13="#46BDDD"           # Bright Blue (Folder)
export COLOR_14="#756B8A"           # Bright Magenta
export COLOR_15="#3FB2B9"           # Bright Cyan
export COLOR_16="#D2FAFF"           # Bright White

export BACKGROUND_COLOR="#0E3C46"   # Background
export FOREGROUND_COLOR="#C7DBDD"   # Foreground (Text)

export CURSOR_COLOR="#C7DBDD" # Cursor

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
