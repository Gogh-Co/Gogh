#!/usr/bin/env bash

export PROFILE_NAME="Madrid"

export COLOR_01="#FAFAFA"           # Black (Host)
export COLOR_02="#990026"           # Red (Syntax string)
export COLOR_03="#007A28"           # Green (Command)
export COLOR_04="#8A6408"           # Yellow (Command second)
export COLOR_05="#007A9E"           # Blue (Path)
export COLOR_06="#4D2699"           # Magenta (Syntax var)
export COLOR_07="#007A9E"           # Cyan (Prompt)
export COLOR_08="#1A1A1A"           # White

export COLOR_09="#4D4D4D"           # Bright Black
export COLOR_10="#990026"           # Bright Red (Command error)
export COLOR_11="#007A28"           # Bright Green (Exec)
export COLOR_12="#8A6408"           # Bright Yellow
export COLOR_13="#007A9E"           # Bright Blue (Folder)
export COLOR_14="#4D2699"           # Bright Magenta
export COLOR_15="#007A9E"           # Bright Cyan
export COLOR_16="#1A1A1A"           # Bright White

export BACKGROUND_COLOR="#FAFAFA"   # Background
export FOREGROUND_COLOR="#1A1A1A"   # Foreground (Text)

export CURSOR_COLOR="#1A1A1A" # Cursor

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
