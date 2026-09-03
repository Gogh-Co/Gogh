#!/usr/bin/env bash

export PROFILE_NAME="Sublette"

export COLOR_01="#253045"           # Black (Host)
export COLOR_02="#EE5577"           # Red (Syntax string)
export COLOR_03="#55EE77"           # Green (Command)
export COLOR_04="#FFDD88"           # Yellow (Command second)
export COLOR_05="#5588FF"           # Blue (Path)
export COLOR_06="#FF77CC"           # Magenta (Syntax var)
export COLOR_07="#44EEEE"           # Cyan (Prompt)
export COLOR_08="#F5F5DA"           # White

export COLOR_09="#405570"           # Bright Black
export COLOR_10="#EE6655"           # Bright Red (Command error)
export COLOR_11="#99EE77"           # Bright Green (Exec)
export COLOR_12="#FFFF77"           # Bright Yellow
export COLOR_13="#77BBFF"           # Bright Blue (Folder)
export COLOR_14="#AA88FF"           # Bright Magenta
export COLOR_15="#55FFBB"           # Bright Cyan
export COLOR_16="#FFFFEE"           # Bright White

export BACKGROUND_COLOR="#202535"   # Background
export FOREGROUND_COLOR="#CCCED0"   # Foreground (Text)

export CURSOR_COLOR="#CCCED0" # Cursor

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
