#!/usr/bin/env bash

export PROFILE_NAME="Selenized Light"

export COLOR_01="#ECE3CC"           # Black (Host)
export COLOR_02="#D2212D"           # Red (Syntax string)
export COLOR_03="#489100"           # Green (Command)
export COLOR_04="#AD8900"           # Yellow (Command second)
export COLOR_05="#0072D4"           # Blue (Path)
export COLOR_06="#CA4898"           # Magenta (Syntax var)
export COLOR_07="#009C8F"           # Cyan (Prompt)
export COLOR_08="#53676D"           # White

export COLOR_09="#909995"           # Bright Black
export COLOR_10="#CC1729"           # Bright Red (Command error)
export COLOR_11="#428B00"           # Bright Green (Exec)
export COLOR_12="#A78300"           # Bright Yellow
export COLOR_13="#006DCE"           # Bright Blue (Folder)
export COLOR_14="#C44392"           # Bright Magenta
export COLOR_15="#00978A"           # Bright Cyan
export COLOR_16="#3A4D53"           # Bright White

export BACKGROUND_COLOR="#FBF3DB"   # Background
export FOREGROUND_COLOR="#53676D"   # Foreground (Text)

export CURSOR_COLOR="#53676D" # Cursor

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
