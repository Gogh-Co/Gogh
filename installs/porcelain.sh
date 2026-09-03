#!/usr/bin/env bash

export PROFILE_NAME="Porcelain"

export COLOR_01="#2A2E37"           # Black (Host)
export COLOR_02="#C60018"           # Red (Syntax string)
export COLOR_03="#157424"           # Green (Command)
export COLOR_04="#855700"           # Yellow (Command second)
export COLOR_05="#004CC8"           # Blue (Path)
export COLOR_06="#761BC3"           # Magenta (Syntax var)
export COLOR_07="#006873"           # Cyan (Prompt)
export COLOR_08="#5A6170"           # White

export COLOR_09="#828896"           # Bright Black
export COLOR_10="#D60027"           # Bright Red (Command error)
export COLOR_11="#1B842D"           # Bright Green (Exec)
export COLOR_12="#AF2700"           # Bright Yellow
export COLOR_13="#005BDB"           # Bright Blue (Folder)
export COLOR_14="#862AD2"           # Bright Magenta
export COLOR_15="#007F8F"           # Bright Cyan
export COLOR_16="#1B1E25"           # Bright White

export BACKGROUND_COLOR="#FBFBFD"   # Background
export FOREGROUND_COLOR="#2A2E37"   # Foreground (Text)

export CURSOR_COLOR="#0054D1" # Cursor

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
