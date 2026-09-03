#!/usr/bin/env bash

export PROFILE_NAME="Tempus Totus"

export COLOR_01="#4A484D"           # Black (Host)
export COLOR_02="#A50000"           # Red (Syntax string)
export COLOR_03="#005D26"           # Green (Command)
export COLOR_04="#714700"           # Yellow (Command second)
export COLOR_05="#1D3CCF"           # Blue (Path)
export COLOR_06="#88267A"           # Magenta (Syntax var)
export COLOR_07="#185570"           # Cyan (Prompt)
export COLOR_08="#EFEFEF"           # White

export COLOR_09="#5E4B4F"           # Bright Black
export COLOR_10="#992030"           # Bright Red (Command error)
export COLOR_11="#4A5500"           # Bright Green (Exec)
export COLOR_12="#8A3600"           # Bright Yellow
export COLOR_13="#2D45B0"           # Bright Blue (Folder)
export COLOR_14="#700DC9"           # Bright Magenta
export COLOR_15="#005289"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#4A484D"   # Foreground (Text)

export CURSOR_COLOR="#4A484D" # Cursor

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
