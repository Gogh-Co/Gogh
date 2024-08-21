#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic I"

export COLOR_01="#1d201d"           # Black (Host)
export COLOR_02="#5c6feb"           # Red (Syntax string)
export COLOR_03="#91a404"           # Green (Command)
export COLOR_04="#c5dc18"           # Yellow (Command second)
export COLOR_05="#24cc38"           # Blue (Path)
export COLOR_06="#23b4c7"           # Magenta (Syntax var)
export COLOR_07="#adc115"           # Cyan (Prompt)
export COLOR_08="#e8ede9"           # White

export COLOR_09="#080d08"           # Bright Black
export COLOR_10="#929ff7"           # Bright Red (Command error)
export COLOR_11="#cee61a"           # Bright Green (Exec)
export COLOR_12="#e6f28c"           # Bright Yellow
export COLOR_13="#b5f2bc"           # Bright Blue (Folder)
export COLOR_14="#3ccadd"           # Bright Magenta
export COLOR_15="#97eda1"           # Bright Cyan
export COLOR_16="#f6f9f6"           # Bright White

export BACKGROUND_COLOR="#1d201d"   # Background
export FOREGROUND_COLOR="#949e95"   # Foreground (Text)

export CURSOR_COLOR="#83856f" # Cursor

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
