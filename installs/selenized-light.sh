#!/usr/bin/env bash

export PROFILE_NAME="Selenized Light"

export COLOR_01="#ece3cc"           # Black (Host)
export COLOR_02="#d2212d"           # Red (Syntax string)
export COLOR_03="#489100"           # Green (Command)
export COLOR_04="#ad8900"           # Yellow (Command second)
export COLOR_05="#0072d4"           # Blue (Path)
export COLOR_06="#ca4898"           # Magenta (Syntax var)
export COLOR_07="#009c8f"           # Cyan (Prompt)
export COLOR_08="#909995"           # White

export COLOR_09="#d5cdb6"           # Bright Black
export COLOR_10="#cc1729"           # Bright Red (Command error)
export COLOR_11="#428b00"           # Bright Green (Exec)
export COLOR_12="#a78300"           # Bright Yellow
export COLOR_13="#006dce"           # Bright Blue (Folder)
export COLOR_14="#c44392"           # Bright Magenta
export COLOR_15="#00978a"           # Bright Cyan
export COLOR_16="#3a4d53"           # Bright White

export BACKGROUND_COLOR="#fbf3db"   # Background
export FOREGROUND_COLOR="#53676d"   # Foreground (Text)

export CURSOR_COLOR="#3a4d53" # Cursor

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
