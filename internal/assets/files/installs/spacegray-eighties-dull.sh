#!/usr/bin/env bash

export PROFILE_NAME="Spacegray Eighties Dull"

export COLOR_01="#15171C"           # Black (Host)
export COLOR_02="#B24A56"           # Red (Syntax string)
export COLOR_03="#92B477"           # Green (Command)
export COLOR_04="#C6735A"           # Yellow (Command second)
export COLOR_05="#7C8FA5"           # Blue (Path)
export COLOR_06="#A5789E"           # Magenta (Syntax var)
export COLOR_07="#80CDCB"           # Cyan (Prompt)
export COLOR_08="#B3B8C3"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#EC5F67"           # Bright Red (Command error)
export COLOR_11="#89E986"           # Bright Green (Exec)
export COLOR_12="#FEC254"           # Bright Yellow
export COLOR_13="#5486C0"           # Bright Blue (Folder)
export COLOR_14="#BF83C1"           # Bright Magenta
export COLOR_15="#58C2C1"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#222222"   # Background
export FOREGROUND_COLOR="#C9C6BC"   # Foreground (Text)

export CURSOR_COLOR="#C9C6BC" # Cursor

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
