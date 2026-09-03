#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Earth"

export COLOR_01="#322D29"           # Black (Host)
export COLOR_02="#816D5F"           # Red (Syntax string)
export COLOR_03="#D9B154"           # Green (Command)
export COLOR_04="#FCC440"           # Yellow (Command second)
export COLOR_05="#88786D"           # Blue (Path)
export COLOR_06="#D9B154"           # Magenta (Syntax var)
export COLOR_07="#967E6E"           # Cyan (Prompt)
export COLOR_08="#B5A9A1"           # White

export COLOR_09="#6A5F58"           # Bright Black
export COLOR_10="#E6B84D"           # Bright Red (Command error)
export COLOR_11="#3F3A37"           # Bright Green (Exec)
export COLOR_12="#5B534D"           # Bright Yellow
export COLOR_13="#796B63"           # Bright Blue (Folder)
export COLOR_14="#DFB99F"           # Bright Magenta
export COLOR_15="#CDA956"           # Bright Cyan
export COLOR_16="#FFF3EB"           # Bright White

export BACKGROUND_COLOR="#322D29"   # Background
export FOREGROUND_COLOR="#B5A9A1"   # Foreground (Text)

export CURSOR_COLOR="#9C8349" # Cursor

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
