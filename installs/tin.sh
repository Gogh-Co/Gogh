#!/usr/bin/env bash

export PROFILE_NAME="Tin"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#8D534E"           # Red (Syntax string)
export COLOR_03="#4E8D53"           # Green (Command)
export COLOR_04="#888D4E"           # Yellow (Command second)
export COLOR_05="#534E8D"           # Blue (Path)
export COLOR_06="#8D4E88"           # Magenta (Syntax var)
export COLOR_07="#4E888D"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#B57D78"           # Bright Red (Command error)
export COLOR_11="#78B57D"           # Bright Green (Exec)
export COLOR_12="#B0B578"           # Bright Yellow
export COLOR_13="#7D78B5"           # Bright Blue (Folder)
export COLOR_14="#B578B0"           # Bright Magenta
export COLOR_15="#78B0B5"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2E2E35"   # Background
export FOREGROUND_COLOR="#FFFFFF"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
