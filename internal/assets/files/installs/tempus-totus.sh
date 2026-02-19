#!/usr/bin/env bash

export PROFILE_NAME="Tempus Totus"

export COLOR_01="#4a484d"           # Black (Host)
export COLOR_02="#a50000"           # Red (Syntax string)
export COLOR_03="#005d26"           # Green (Command)
export COLOR_04="#714700"           # Yellow (Command second)
export COLOR_05="#1d3ccf"           # Blue (Path)
export COLOR_06="#88267a"           # Magenta (Syntax var)
export COLOR_07="#185570"           # Cyan (Prompt)
export COLOR_08="#efefef"           # White

export COLOR_09="#5e4b4f"           # Bright Black
export COLOR_10="#992030"           # Bright Red (Command error)
export COLOR_11="#4a5500"           # Bright Green (Exec)
export COLOR_12="#8a3600"           # Bright Yellow
export COLOR_13="#2d45b0"           # Bright Blue (Folder)
export COLOR_14="#700dc9"           # Bright Magenta
export COLOR_15="#005289"           # Bright Cyan
export COLOR_16="#ffffff"           # Bright White

export BACKGROUND_COLOR="#ffffff"   # Background
export FOREGROUND_COLOR="#4a484d"   # Foreground (Text)

export CURSOR_COLOR="#4a484d" # Cursor

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
