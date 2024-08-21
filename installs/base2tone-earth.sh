#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Earth"

export COLOR_01="#322d29"           # Black (Host)
export COLOR_02="#816d5f"           # Red (Syntax string)
export COLOR_03="#d9b154"           # Green (Command)
export COLOR_04="#fcc440"           # Yellow (Command second)
export COLOR_05="#88786d"           # Blue (Path)
export COLOR_06="#d9b154"           # Magenta (Syntax var)
export COLOR_07="#967e6e"           # Cyan (Prompt)
export COLOR_08="#b5a9a1"           # White

export COLOR_09="#6a5f58"           # Bright Black
export COLOR_10="#e6b84d"           # Bright Red (Command error)
export COLOR_11="#3f3a37"           # Bright Green (Exec)
export COLOR_12="#5b534d"           # Bright Yellow
export COLOR_13="#796b63"           # Bright Blue (Folder)
export COLOR_14="#dfb99f"           # Bright Magenta
export COLOR_15="#cda956"           # Bright Cyan
export COLOR_16="#fff3eb"           # Bright White

export BACKGROUND_COLOR="#322d29"   # Background
export FOREGROUND_COLOR="#b5a9a1"   # Foreground (Text)

export CURSOR_COLOR="#9c8349" # Cursor

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
