#!/usr/bin/env bash

export PROFILE_NAME="Shapeshifter"

export COLOR_01="#F9F9F9"           # Black (Host)
export COLOR_02="#E92F2F"           # Red (Syntax string)
export COLOR_03="#0ED839"           # Green (Command)
export COLOR_04="#DDDD13"           # Yellow (Command second)
export COLOR_05="#3B48E3"           # Blue (Path)
export COLOR_06="#F996E2"           # Magenta (Syntax var)
export COLOR_07="#23EDDA"           # Cyan (Prompt)
export COLOR_08="#102015"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#E92F2F"           # Bright Red (Command error)
export COLOR_11="#0ED839"           # Bright Green (Exec)
export COLOR_12="#DDDD13"           # Bright Yellow
export COLOR_13="#3B48E3"           # Bright Blue (Folder)
export COLOR_14="#F996E2"           # Bright Magenta
export COLOR_15="#23EDDA"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#F9F9F9"   # Background
export FOREGROUND_COLOR="#102015"   # Foreground (Text)

export CURSOR_COLOR="#102015" # Cursor

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
