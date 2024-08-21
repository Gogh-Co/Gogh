#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic Q"

export COLOR_01="#1d1d20"           # Black (Host)
export COLOR_02="#d4359a"           # Red (Syntax string)
export COLOR_03="#4287f5"           # Green (Command)
export COLOR_04="#88b4fc"           # Yellow (Command second)
export COLOR_05="#a095f3"           # Blue (Path)
export COLOR_06="#ba6cea"           # Magenta (Syntax var)
export COLOR_07="#659efb"           # Cyan (Prompt)
export COLOR_08="#e9e8ed"           # White

export COLOR_09="#08070d"           # Bright Black
export COLOR_10="#eb75c0"           # Bright Red (Command error)
export COLOR_11="#9cc1fc"           # Bright Green (Exec)
export COLOR_12="#c2d9ff"           # Bright Yellow
export COLOR_13="#d9d5fc"           # Bright Blue (Folder)
export COLOR_14="#c988f2"           # Bright Magenta
export COLOR_15="#d1cbfb"           # Bright Cyan
export COLOR_16="#f6f6f9"           # Bright White

export BACKGROUND_COLOR="#1d1d20"   # Background
export FOREGROUND_COLOR="#95949e"   # Foreground (Text)

export CURSOR_COLOR="#67768e" # Cursor

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
