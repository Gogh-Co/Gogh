#!/usr/bin/env bash

export PROFILE_NAME="Mono Amber"

export COLOR_01="#402500"           # Black (Host)
export COLOR_02="#FF9400"           # Red (Syntax string)
export COLOR_03="#FF9400"           # Green (Command)
export COLOR_04="#FF9400"           # Yellow (Command second)
export COLOR_05="#FF9400"           # Blue (Path)
export COLOR_06="#FF9400"           # Magenta (Syntax var)
export COLOR_07="#FF9400"           # Cyan (Prompt)
export COLOR_08="#FF9400"           # White

export COLOR_09="#FF9400"           # Bright Black
export COLOR_10="#FF9400"           # Bright Red (Command error)
export COLOR_11="#FF9400"           # Bright Green (Exec)
export COLOR_12="#FF9400"           # Bright Yellow
export COLOR_13="#FF9400"           # Bright Blue (Folder)
export COLOR_14="#FF9400"           # Bright Magenta
export COLOR_15="#FF9400"           # Bright Cyan
export COLOR_16="#FF9400"           # Bright White

export BACKGROUND_COLOR="#2B1900"   # Background
export FOREGROUND_COLOR="#FF9400"   # Foreground (Text)

export CURSOR_COLOR="#FF9400" # Cursor

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
