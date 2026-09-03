#!/usr/bin/env bash

export PROFILE_NAME="Idea"

export COLOR_01="#ADADAD"           # Black (Host)
export COLOR_02="#FC5256"           # Red (Syntax string)
export COLOR_03="#98B61C"           # Green (Command)
export COLOR_04="#CCB444"           # Yellow (Command second)
export COLOR_05="#437EE7"           # Blue (Path)
export COLOR_06="#9D74B0"           # Magenta (Syntax var)
export COLOR_07="#248887"           # Cyan (Prompt)
export COLOR_08="#181818"           # White

export COLOR_09="#FFFFFF"           # Bright Black
export COLOR_10="#FC7072"           # Bright Red (Command error)
export COLOR_11="#98B61C"           # Bright Green (Exec)
export COLOR_12="#FFFF0B"           # Bright Yellow
export COLOR_13="#6C9CED"           # Bright Blue (Folder)
export COLOR_14="#FC7EFF"           # Bright Magenta
export COLOR_15="#248887"           # Bright Cyan
export COLOR_16="#181818"           # Bright White

export BACKGROUND_COLOR="#202020"   # Background
export FOREGROUND_COLOR="#ADADAD"   # Foreground (Text)

export CURSOR_COLOR="#BBBBBB" # Cursor

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
