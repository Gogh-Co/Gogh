#!/usr/bin/env bash

export PROFILE_NAME="Tokyo Night Dark"

export COLOR_01="#1A1B26"           # Black (Host)
export COLOR_02="#C0CAF5"           # Red (Syntax string)
export COLOR_03="#9ECE6A"           # Green (Command)
export COLOR_04="#0DB9D7"           # Yellow (Command second)
export COLOR_05="#2AC3DE"           # Blue (Path)
export COLOR_06="#BB9AF7"           # Magenta (Syntax var)
export COLOR_07="#B4F9F8"           # Cyan (Prompt)
export COLOR_08="#A9B1D6"           # White

export COLOR_09="#444B6A"           # Bright Black
export COLOR_10="#FF7A93"           # Bright Red (Command error)
export COLOR_11="#73DACA"           # Bright Green (Exec)
export COLOR_12="#FF9E64"           # Bright Yellow
export COLOR_13="#89DDFF"           # Bright Blue (Folder)
export COLOR_14="#BB9AF7"           # Bright Magenta
export COLOR_15="#7DCFFF"           # Bright Cyan
export COLOR_16="#D5D6DB"           # Bright White

export BACKGROUND_COLOR="#1A1B26"   # Background
export FOREGROUND_COLOR="#A9B1D6"   # Foreground (Text)

export CURSOR_COLOR="#A9B1D6" # Cursor

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
