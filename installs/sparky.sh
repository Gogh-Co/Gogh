#!/usr/bin/env bash

export PROFILE_NAME="Sparky"

export COLOR_01="#212322"           # Black (Host)
export COLOR_02="#FF585D"           # Red (Syntax string)
export COLOR_03="#78D64B"           # Green (Command)
export COLOR_04="#FBDD40"           # Yellow (Command second)
export COLOR_05="#4698CB"           # Blue (Path)
export COLOR_06="#D59ED7"           # Magenta (Syntax var)
export COLOR_07="#2DCCD3"           # Cyan (Prompt)
export COLOR_08="#DEE6DE"           # White

export COLOR_09="#4B4F54"           # Bright Black
export COLOR_10="#FF7276"           # Bright Red (Command error)
export COLOR_11="#8EDD65"           # Bright Green (Exec)
export COLOR_12="#F6EB61"           # Bright Yellow
export COLOR_13="#69B3E7"           # Bright Blue (Folder)
export COLOR_14="#F99FC9"           # Bright Magenta
export COLOR_15="#00C1D5"           # Bright Cyan
export COLOR_16="#D9E1E2"           # Bright White

export BACKGROUND_COLOR="#072B31"   # Background
export FOREGROUND_COLOR="#F4F5F0"   # Foreground (Text)

export CURSOR_COLOR="#F4F5F0" # Cursor

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
