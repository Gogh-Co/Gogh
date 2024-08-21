#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Mall"

export COLOR_01="#1e1e1f"           # Black (Host)
export COLOR_02="#a17efc"           # Red (Syntax string)
export COLOR_03="#75bfff"           # Green (Command)
export COLOR_04="#b3dbff"           # Yellow (Command second)
export COLOR_05="#b294ff"           # Blue (Path)
export COLOR_06="#75bfff"           # Magenta (Syntax var)
export COLOR_07="#c5adff"           # Cyan (Prompt)
export COLOR_08="#97959d"           # White

export COLOR_09="#5e5c60"           # Bright Black
export COLOR_10="#8ac8ff"           # Bright Red (Command error)
export COLOR_11="#2b2b2c"           # Bright Green (Exec)
export COLOR_12="#515053"           # Bright Yellow
export COLOR_13="#6a686e"           # Bright Blue (Folder)
export COLOR_14="#e5dbff"           # Bright Magenta
export COLOR_15="#69b5f7"           # Bright Cyan
export COLOR_16="#f4f0ff"           # Bright White

export BACKGROUND_COLOR="#1e1e1f"   # Background
export FOREGROUND_COLOR="#97959d"   # Foreground (Text)

export CURSOR_COLOR="#3692e2" # Cursor

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
