#!/usr/bin/env bash

export PROFILE_NAME="Solarflare Light"

export COLOR_01="#F5F7FA"           # Black (Host)
export COLOR_02="#EF5253"           # Red (Syntax string)
export COLOR_03="#7CC844"           # Green (Command)
export COLOR_04="#E4B51C"           # Yellow (Command second)
export COLOR_05="#33B5E1"           # Blue (Path)
export COLOR_06="#A363D5"           # Magenta (Syntax var)
export COLOR_07="#52CBB0"           # Cyan (Prompt)
export COLOR_08="#586875"           # White

export COLOR_09="#85939E"           # Bright Black
export COLOR_10="#EF5253"           # Bright Red (Command error)
export COLOR_11="#7CC844"           # Bright Green (Exec)
export COLOR_12="#E4B51C"           # Bright Yellow
export COLOR_13="#33B5E1"           # Bright Blue (Folder)
export COLOR_14="#A363D5"           # Bright Magenta
export COLOR_15="#52CBB0"           # Bright Cyan
export COLOR_16="#18262F"           # Bright White

export BACKGROUND_COLOR="#F5F7FA"   # Background
export FOREGROUND_COLOR="#586875"   # Foreground (Text)

export CURSOR_COLOR="#586875" # Cursor

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
