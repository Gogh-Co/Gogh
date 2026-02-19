#!/usr/bin/env bash

export PROFILE_NAME="Frontend Delight"

export COLOR_01="#242526"           # Black (Host)
export COLOR_02="#F8511B"           # Red (Syntax string)
export COLOR_03="#565747"           # Green (Command)
export COLOR_04="#FA771D"           # Yellow (Command second)
export COLOR_05="#2C70B7"           # Blue (Path)
export COLOR_06="#F02E4F"           # Magenta (Syntax var)
export COLOR_07="#3CA1A6"           # Cyan (Prompt)
export COLOR_08="#ADADAD"           # White

export COLOR_09="#5FAC6D"           # Bright Black
export COLOR_10="#F74319"           # Bright Red (Command error)
export COLOR_11="#74EC4C"           # Bright Green (Exec)
export COLOR_12="#FDC325"           # Bright Yellow
export COLOR_13="#3393CA"           # Bright Blue (Folder)
export COLOR_14="#E75E4F"           # Bright Magenta
export COLOR_15="#4FBCE6"           # Bright Cyan
export COLOR_16="#8C735B"           # Bright White

export BACKGROUND_COLOR="#1B1C1D"   # Background
export FOREGROUND_COLOR="#ADADAD"   # Foreground (Text)

export CURSOR_COLOR="#ADADAD" # Cursor

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
