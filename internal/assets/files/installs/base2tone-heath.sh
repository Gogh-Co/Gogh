#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Heath"

export COLOR_01="#222022"           # Black (Host)
export COLOR_02="#8f6c93"           # Red (Syntax string)
export COLOR_03="#cc8c33"           # Green (Command)
export COLOR_04="#ffd599"           # Yellow (Command second)
export COLOR_05="#9a819c"           # Blue (Path)
export COLOR_06="#cc8c33"           # Magenta (Syntax var)
export COLOR_07="#cb79d2"           # Cyan (Prompt)
export COLOR_08="#9e999f"           # White

export COLOR_09="#635f63"           # Bright Black
export COLOR_10="#d9b98c"           # Bright Red (Command error)
export COLOR_11="#2f2d2f"           # Bright Green (Exec)
export COLOR_12="#575158"           # Bright Yellow
export COLOR_13="#6f6b70"           # Bright Blue (Folder)
export COLOR_14="#eaa8f0"           # Bright Magenta
export COLOR_15="#c38022"           # Bright Cyan
export COLOR_16="#fdebff"           # Bright White

export BACKGROUND_COLOR="#222022"   # Background
export FOREGROUND_COLOR="#9e999f"   # Foreground (Text)

export CURSOR_COLOR="#995900" # Cursor

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
