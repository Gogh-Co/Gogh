#!/usr/bin/env bash

export PROFILE_NAME="Gotham"

export COLOR_01="#0A0F14"           # Black (Host)
export COLOR_02="#C33027"           # Red (Syntax string)
export COLOR_03="#26A98B"           # Green (Command)
export COLOR_04="#EDB54B"           # Yellow (Command second)
export COLOR_05="#195465"           # Blue (Path)
export COLOR_06="#4E5165"           # Magenta (Syntax var)
export COLOR_07="#33859D"           # Cyan (Prompt)
export COLOR_08="#98D1CE"           # White

export COLOR_09="#10151B"           # Bright Black
export COLOR_10="#D26939"           # Bright Red (Command error)
export COLOR_11="#081F2D"           # Bright Green (Exec)
export COLOR_12="#245361"           # Bright Yellow
export COLOR_13="#093748"           # Bright Blue (Folder)
export COLOR_14="#888BA5"           # Bright Magenta
export COLOR_15="#599CAA"           # Bright Cyan
export COLOR_16="#D3EBE9"           # Bright White

export BACKGROUND_COLOR="#0A0F14"   # Background
export FOREGROUND_COLOR="#98D1CE"   # Foreground (Text)

export CURSOR_COLOR="#98D1CE" # Cursor

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
