#!/usr/bin/env bash

export PROFILE_NAME="Dark Pride"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#CA1444"           # Red (Syntax string)
export COLOR_03="#789ABA"           # Green (Command)
export COLOR_04="#B3879F"           # Yellow (Command second)
export COLOR_05="#94469B"           # Blue (Path)
export COLOR_06="#CB6FA1"           # Magenta (Syntax var)
export COLOR_07="#FB6E93"           # Cyan (Prompt)
export COLOR_08="#CF98C1"           # White

export COLOR_09="#98218E"           # Bright Black
export COLOR_10="#CB515D"           # Bright Red (Command error)
export COLOR_11="#5A87B1"           # Bright Green (Exec)
export COLOR_12="#9C61AB"           # Bright Yellow
export COLOR_13="#9A77B1"           # Bright Blue (Folder)
export COLOR_14="#F2A297"           # Bright Magenta
export COLOR_15="#F4436F"           # Bright Cyan
export COLOR_16="#EBDBB2"           # Bright White

export BACKGROUND_COLOR="#0D0D1B"   # Background
export FOREGROUND_COLOR="#CCCCCE"   # Foreground (Text)

export CURSOR_COLOR="#CCCCCE" # Cursor

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
