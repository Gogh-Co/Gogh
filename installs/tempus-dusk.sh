#!/usr/bin/env bash

export PROFILE_NAME="Tempus Dusk"

export COLOR_01="#1F252D"           # Black (Host)
export COLOR_02="#CB8D56"           # Red (Syntax string)
export COLOR_03="#8BA089"           # Green (Command)
export COLOR_04="#A79C46"           # Yellow (Command second)
export COLOR_05="#8C9ABE"           # Blue (Path)
export COLOR_06="#B190AF"           # Magenta (Syntax var)
export COLOR_07="#8E9ABA"           # Cyan (Prompt)
export COLOR_08="#A29899"           # White

export COLOR_09="#2C3150"           # Bright Black
export COLOR_10="#D39D74"           # Bright Red (Command error)
export COLOR_11="#80B48F"           # Bright Green (Exec)
export COLOR_12="#BDA75A"           # Bright Yellow
export COLOR_13="#9CA5DE"           # Bright Blue (Folder)
export COLOR_14="#C69AC6"           # Bright Magenta
export COLOR_15="#8CAEB6"           # Bright Cyan
export COLOR_16="#A2A8BA"           # Bright White

export BACKGROUND_COLOR="#1F252D"   # Background
export FOREGROUND_COLOR="#A2A8BA"   # Foreground (Text)

export CURSOR_COLOR="#A2A8BA" # Cursor

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
