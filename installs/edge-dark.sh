#!/usr/bin/env bash

export PROFILE_NAME="Edge Dark"

export COLOR_01="#262729"           # Black (Host)
export COLOR_02="#E77171"           # Red (Syntax string)
export COLOR_03="#A1BF78"           # Green (Command)
export COLOR_04="#DBB774"           # Yellow (Command second)
export COLOR_05="#73B3E7"           # Blue (Path)
export COLOR_06="#D390E7"           # Magenta (Syntax var)
export COLOR_07="#5EBAA5"           # Cyan (Prompt)
export COLOR_08="#AFB2B5"           # White

export COLOR_09="#4A4C4F"           # Bright Black
export COLOR_10="#E77171"           # Bright Red (Command error)
export COLOR_11="#A1BF78"           # Bright Green (Exec)
export COLOR_12="#DBB774"           # Bright Yellow
export COLOR_13="#73B3E7"           # Bright Blue (Folder)
export COLOR_14="#D390E7"           # Bright Magenta
export COLOR_15="#5EBAA5"           # Bright Cyan
export COLOR_16="#E4E5E6"           # Bright White

export BACKGROUND_COLOR="#262729"   # Background
export FOREGROUND_COLOR="#AFB2B5"   # Foreground (Text)

export CURSOR_COLOR="#AFB2B5" # Cursor

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
