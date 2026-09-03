#!/usr/bin/env bash

export PROFILE_NAME="Patina Lichen"

export COLOR_01="#393A34"           # Black (Host)
export COLOR_02="#8B4646"           # Red (Syntax string)
export COLOR_03="#33644D"           # Green (Command)
export COLOR_04="#7F5031"           # Yellow (Command second)
export COLOR_05="#35616D"           # Blue (Path)
export COLOR_06="#854B3F"           # Magenta (Syntax var)
export COLOR_07="#2A6361"           # Cyan (Prompt)
export COLOR_08="#5A5248"           # White

export COLOR_09="#5B5B54"           # Bright Black
export COLOR_10="#8B4646"           # Bright Red (Command error)
export COLOR_11="#426338"           # Bright Green (Exec)
export COLOR_12="#7F5031"           # Bright Yellow
export COLOR_13="#35616D"           # Bright Blue (Folder)
export COLOR_14="#854B3F"           # Bright Magenta
export COLOR_15="#2A6361"           # Bright Cyan
export COLOR_16="#393A34"           # Bright White

export BACKGROUND_COLOR="#CDD1C6"   # Background
export FOREGROUND_COLOR="#393A34"   # Foreground (Text)

export CURSOR_COLOR="#393A34" # Cursor

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
