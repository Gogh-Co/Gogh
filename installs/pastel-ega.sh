#!/usr/bin/env bash

export PROFILE_NAME="Pastel Ega"

export COLOR_01="#414141"           # Black (Host)
export COLOR_02="#DD4274"           # Red (Syntax string)
export COLOR_03="#1DB37B"           # Green (Command)
export COLOR_04="#CBAE25"           # Yellow (Command second)
export COLOR_05="#4C96D7"           # Blue (Path)
export COLOR_06="#BF2FAF"           # Magenta (Syntax var)
export COLOR_07="#41BCBC"           # Cyan (Prompt)
export COLOR_08="#BFBFBF"           # White

export COLOR_09="#8D8D8D"           # Bright Black
export COLOR_10="#DB7497"           # Bright Red (Command error)
export COLOR_11="#70E6AE"           # Bright Green (Exec)
export COLOR_12="#FAF8AC"           # Bright Yellow
export COLOR_13="#A5D2F3"           # Bright Blue (Folder)
export COLOR_14="#DF7CD3"           # Bright Magenta
export COLOR_15="#5FE4E4"           # Bright Cyan
export COLOR_16="#F6F6F6"           # Bright White

export BACKGROUND_COLOR="#414141"   # Background
export FOREGROUND_COLOR="#F6F6F6"   # Foreground (Text)

export CURSOR_COLOR="#F6F6F6" # Cursor

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
