#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Drawbridge"

export COLOR_01="#1b1f32"           # Black (Host)
export COLOR_02="#627af4"           # Red (Syntax string)
export COLOR_03="#67c9e4"           # Green (Command)
export COLOR_04="#99e9ff"           # Yellow (Command second)
export COLOR_05="#7289fd"           # Blue (Path)
export COLOR_06="#67c9e4"           # Magenta (Syntax var)
export COLOR_07="#8b9efd"           # Cyan (Prompt)
export COLOR_08="#9094a7"           # White

export COLOR_09="#51587b"           # Bright Black
export COLOR_10="#75d5f0"           # Bright Red (Command error)
export COLOR_11="#252a41"           # Bright Green (Exec)
export COLOR_12="#444b6f"           # Bright Yellow
export COLOR_13="#5e6587"           # Bright Blue (Folder)
export COLOR_14="#c3cdfe"           # Bright Magenta
export COLOR_15="#5cbcd6"           # Bright Cyan
export COLOR_16="#e1e6ff"           # Bright White

export BACKGROUND_COLOR="#1b1f32"   # Background
export FOREGROUND_COLOR="#9094a7"   # Foreground (Text)

export CURSOR_COLOR="#289dbd" # Cursor

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
