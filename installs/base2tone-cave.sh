#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Cave"

export COLOR_01="#222021"           # Black (Host)
export COLOR_02="#936c7a"           # Red (Syntax string)
export COLOR_03="#cca133"           # Green (Command)
export COLOR_04="#ffcc4d"           # Yellow (Command second)
export COLOR_05="#9c818b"           # Blue (Path)
export COLOR_06="#cca133"           # Magenta (Syntax var)
export COLOR_07="#d27998"           # Cyan (Prompt)
export COLOR_08="#9f999b"           # White

export COLOR_09="#635f60"           # Bright Black
export COLOR_10="#ddaf3c"           # Bright Red (Command error)
export COLOR_11="#2f2d2e"           # Bright Green (Exec)
export COLOR_12="#565254"           # Bright Yellow
export COLOR_13="#706b6d"           # Bright Blue (Folder)
export COLOR_14="#f0a8c1"           # Bright Magenta
export COLOR_15="#c39622"           # Bright Cyan
export COLOR_16="#ffebf2"           # Bright White

export BACKGROUND_COLOR="#222021"   # Background
export FOREGROUND_COLOR="#9f999b"   # Foreground (Text)

export CURSOR_COLOR="#996e00" # Cursor

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
