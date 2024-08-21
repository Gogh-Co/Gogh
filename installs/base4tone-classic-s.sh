#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic S"

export COLOR_01="#1f1d20"           # Black (Host)
export COLOR_02="#d64f3d"           # Red (Syntax string)
export COLOR_03="#7e70e6"           # Green (Command)
export COLOR_04="#aba1f7"           # Yellow (Command second)
export COLOR_05="#c27eed"           # Blue (Path)
export COLOR_06="#e963b8"           # Magenta (Syntax var)
export COLOR_07="#9488f2"           # Cyan (Prompt)
export COLOR_08="#ebe8ed"           # White

export COLOR_09="#0b070d"           # Bright Black
export COLOR_10="#eb8275"           # Bright Red (Command error)
export COLOR_11="#b7aff8"           # Bright Green (Exec)
export COLOR_12="#d1cbfb"           # Bright Yellow
export COLOR_13="#e6c8f9"           # Bright Blue (Folder)
export COLOR_14="#f17ec7"           # Bright Magenta
export COLOR_15="#e0baf7"           # Bright Cyan
export COLOR_16="#f8f6f9"           # Bright White

export BACKGROUND_COLOR="#1f1d20"   # Background
export FOREGROUND_COLOR="#9a949e"   # Foreground (Text)

export CURSOR_COLOR="#767481" # Cursor

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
