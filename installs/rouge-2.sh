#!/usr/bin/env bash

export PROFILE_NAME="Rouge 2"

export COLOR_01="#5D5D6B"           # Black (Host)
export COLOR_02="#C6797E"           # Red (Syntax string)
export COLOR_03="#969E92"           # Green (Command)
export COLOR_04="#DBCDAB"           # Yellow (Command second)
export COLOR_05="#6E94B9"           # Blue (Path)
export COLOR_06="#4C4E78"           # Magenta (Syntax var)
export COLOR_07="#8AB6C1"           # Cyan (Prompt)
export COLOR_08="#E8E8EA"           # White

export COLOR_09="#616274"           # Bright Black
export COLOR_10="#C6797E"           # Bright Red (Command error)
export COLOR_11="#E6DCC4"           # Bright Green (Exec)
export COLOR_12="#E6DCC4"           # Bright Yellow
export COLOR_13="#98B3CD"           # Bright Blue (Folder)
export COLOR_14="#8283A1"           # Bright Magenta
export COLOR_15="#ABCBD3"           # Bright Cyan
export COLOR_16="#E8E8EA"           # Bright White

export BACKGROUND_COLOR="#17182B"   # Background
export FOREGROUND_COLOR="#A2A3AA"   # Foreground (Text)

export CURSOR_COLOR="#969E92" # Cursor

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
