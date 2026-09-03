#!/usr/bin/env bash

export PROFILE_NAME="Duckbones"

export COLOR_01="#0E101A"           # Black (Host)
export COLOR_02="#E03600"           # Red (Syntax string)
export COLOR_03="#5DCD97"           # Green (Command)
export COLOR_04="#E39500"           # Yellow (Command second)
export COLOR_05="#00A3CB"           # Blue (Path)
export COLOR_06="#795CCC"           # Magenta (Syntax var)
export COLOR_07="#00A3CB"           # Cyan (Prompt)
export COLOR_08="#EBEFC0"           # White

export COLOR_09="#2B2F46"           # Bright Black
export COLOR_10="#FF4821"           # Bright Red (Command error)
export COLOR_11="#58DB9E"           # Bright Green (Exec)
export COLOR_12="#F6A100"           # Bright Yellow
export COLOR_13="#00B4E0"           # Bright Blue (Folder)
export COLOR_14="#B3A1E6"           # Bright Magenta
export COLOR_15="#00B4E0"           # Bright Cyan
export COLOR_16="#B3B692"           # Bright White

export BACKGROUND_COLOR="#0E101A"   # Background
export FOREGROUND_COLOR="#EBEFC0"   # Foreground (Text)

export CURSOR_COLOR="#EDF2C2" # Cursor

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
