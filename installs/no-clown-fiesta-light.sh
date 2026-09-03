#!/usr/bin/env bash

export PROFILE_NAME="No Clown Fiesta Light"

export COLOR_01="#D6D6D6"           # Black (Host)
export COLOR_02="#874E42"           # Red (Syntax string)
export COLOR_03="#677940"           # Green (Command)
export COLOR_04="#B89058"           # Yellow (Command second)
export COLOR_05="#8BA1BF"           # Blue (Path)
export COLOR_06="#AA759F"           # Magenta (Syntax var)
export COLOR_07="#3E5F66"           # Cyan (Prompt)
export COLOR_08="#151515"           # White

export COLOR_09="#2B2B2B"           # Bright Black
export COLOR_10="#637786"           # Bright Red (Command error)
export COLOR_11="#677940"           # Bright Green (Exec)
export COLOR_12="#B89058"           # Bright Yellow
export COLOR_13="#93A2AB"           # Bright Blue (Folder)
export COLOR_14="#AA759F"           # Bright Magenta
export COLOR_15="#99AB93"           # Bright Cyan
export COLOR_16="#373737"           # Bright White

export BACKGROUND_COLOR="#E1E1E1"   # Background
export FOREGROUND_COLOR="#151515"   # Foreground (Text)

export CURSOR_COLOR="#151515" # Cursor

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
