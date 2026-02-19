#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic A"

export COLOR_01="#211d1c"           # Black (Host)
export COLOR_02="#8d9f04"           # Red (Syntax string)
export COLOR_03="#dd40a4"           # Green (Command)
export COLOR_04="#f17ec7"           # Yellow (Command second)
export COLOR_05="#eb8275"           # Blue (Path)
export COLOR_06="#dc9118"           # Magenta (Syntax var)
export COLOR_07="#e963b8"           # Cyan (Prompt)
export COLOR_08="#eee8e8"           # White

export COLOR_09="#0d0807"           # Bright Black
export COLOR_10="#b9cf17"           # Bright Red (Command error)
export COLOR_11="#f391cf"           # Bright Green (Exec)
export COLOR_12="#f6b1dd"           # Bright Yellow
export COLOR_13="#f8cac3"           # Bright Blue (Folder)
export COLOR_14="#e8a02c"           # Bright Magenta
export COLOR_15="#fbbab1"           # Bright Cyan
export COLOR_16="#f9f6f6"           # Bright White

export BACKGROUND_COLOR="#211d1c"   # Background
export FOREGROUND_COLOR="#a19391"   # Foreground (Text)

export CURSOR_COLOR="#81747c" # Cursor

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
