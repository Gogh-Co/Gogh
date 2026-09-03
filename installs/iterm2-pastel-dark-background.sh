#!/usr/bin/env bash

export PROFILE_NAME="iTerm2 Pastel Dark Background"

export COLOR_01="#626262"           # Black (Host)
export COLOR_02="#FF8373"           # Red (Syntax string)
export COLOR_03="#B4FB73"           # Green (Command)
export COLOR_04="#FFFDC3"           # Yellow (Command second)
export COLOR_05="#A5D5FE"           # Blue (Path)
export COLOR_06="#FF90FE"           # Magenta (Syntax var)
export COLOR_07="#D1D1FE"           # Cyan (Prompt)
export COLOR_08="#F1F1F1"           # White

export COLOR_09="#8F8F8F"           # Bright Black
export COLOR_10="#FFC4BE"           # Bright Red (Command error)
export COLOR_11="#D6FCBA"           # Bright Green (Exec)
export COLOR_12="#FFFED5"           # Bright Yellow
export COLOR_13="#C2E3FF"           # Bright Blue (Folder)
export COLOR_14="#FFB2FE"           # Bright Magenta
export COLOR_15="#E6E6FE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#000000"   # Background
export FOREGROUND_COLOR="#C7C7C7"   # Foreground (Text)

export CURSOR_COLOR="#FFB473" # Cursor

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
