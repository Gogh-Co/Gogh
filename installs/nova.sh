#!/usr/bin/env bash

export PROFILE_NAME="Nova"

export COLOR_01="#3C4C55"           # Black (Host)
export COLOR_02="#83AFE5"           # Red (Syntax string)
export COLOR_03="#7FC1CA"           # Green (Command)
export COLOR_04="#A8CE93"           # Yellow (Command second)
export COLOR_05="#83AFE5"           # Blue (Path)
export COLOR_06="#9A93E1"           # Magenta (Syntax var)
export COLOR_07="#F2C38F"           # Cyan (Prompt)
export COLOR_08="#C5D4DD"           # White

export COLOR_09="#899BA6"           # Bright Black
export COLOR_10="#83AFE5"           # Bright Red (Command error)
export COLOR_11="#7FC1CA"           # Bright Green (Exec)
export COLOR_12="#A8CE93"           # Bright Yellow
export COLOR_13="#83AFE5"           # Bright Blue (Folder)
export COLOR_14="#9A93E1"           # Bright Magenta
export COLOR_15="#F2C38F"           # Bright Cyan
export COLOR_16="#556873"           # Bright White

export BACKGROUND_COLOR="#3C4C55"   # Background
export FOREGROUND_COLOR="#C5D4DD"   # Foreground (Text)

export CURSOR_COLOR="#C5D4DD" # Cursor

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
