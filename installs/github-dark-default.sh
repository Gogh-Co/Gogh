#!/usr/bin/env bash

export PROFILE_NAME="GitHub Dark Default"

export COLOR_01="#484F58"           # Black (Host)
export COLOR_02="#FF7B72"           # Red (Syntax string)
export COLOR_03="#3FB950"           # Green (Command)
export COLOR_04="#D29922"           # Yellow (Command second)
export COLOR_05="#58A6FF"           # Blue (Path)
export COLOR_06="#BC8CFF"           # Magenta (Syntax var)
export COLOR_07="#39C5CF"           # Cyan (Prompt)
export COLOR_08="#B1BAC4"           # White

export COLOR_09="#6E7681"           # Bright Black
export COLOR_10="#FFA198"           # Bright Red (Command error)
export COLOR_11="#56D364"           # Bright Green (Exec)
export COLOR_12="#E3B341"           # Bright Yellow
export COLOR_13="#79C0FF"           # Bright Blue (Folder)
export COLOR_14="#D2A8FF"           # Bright Magenta
export COLOR_15="#56D4DD"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D1117"   # Background
export FOREGROUND_COLOR="#E6EDF3"   # Foreground (Text)

export CURSOR_COLOR="#2F81F7" # Cursor

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
