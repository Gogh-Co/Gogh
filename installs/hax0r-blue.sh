#!/usr/bin/env bash

export PROFILE_NAME="HaX0R Blue"

export COLOR_01="#010921"           # Black (Host)
export COLOR_02="#10B6FF"           # Red (Syntax string)
export COLOR_03="#10B6FF"           # Green (Command)
export COLOR_04="#10B6FF"           # Yellow (Command second)
export COLOR_05="#10B6FF"           # Blue (Path)
export COLOR_06="#10B6FF"           # Magenta (Syntax var)
export COLOR_07="#10B6FF"           # Cyan (Prompt)
export COLOR_08="#FAFAFA"           # White

export COLOR_09="#080117"           # Bright Black
export COLOR_10="#00B3F7"           # Bright Red (Command error)
export COLOR_11="#00B3F7"           # Bright Green (Exec)
export COLOR_12="#00B3F7"           # Bright Yellow
export COLOR_13="#00B3F7"           # Bright Blue (Folder)
export COLOR_14="#00B3F7"           # Bright Magenta
export COLOR_15="#00B3F7"           # Bright Cyan
export COLOR_16="#FEFEFE"           # Bright White

export BACKGROUND_COLOR="#010515"   # Background
export FOREGROUND_COLOR="#11B7FF"   # Foreground (Text)

export CURSOR_COLOR="#10B6FF" # Cursor

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
