#!/usr/bin/env bash

export PROFILE_NAME="Material Dark"

export COLOR_01="#212121"           # Black (Host)
export COLOR_02="#B7141F"           # Red (Syntax string)
export COLOR_03="#457B24"           # Green (Command)
export COLOR_04="#F6981E"           # Yellow (Command second)
export COLOR_05="#134EB2"           # Blue (Path)
export COLOR_06="#560088"           # Magenta (Syntax var)
export COLOR_07="#0E717C"           # Cyan (Prompt)
export COLOR_08="#EFEFEF"           # White

export COLOR_09="#424242"           # Bright Black
export COLOR_10="#E83B3F"           # Bright Red (Command error)
export COLOR_11="#7ABA3A"           # Bright Green (Exec)
export COLOR_12="#FFEA2E"           # Bright Yellow
export COLOR_13="#54A4F3"           # Bright Blue (Folder)
export COLOR_14="#AA4DBC"           # Bright Magenta
export COLOR_15="#26BBD1"           # Bright Cyan
export COLOR_16="#D9D9D9"           # Bright White

export BACKGROUND_COLOR="#232322"   # Background
export FOREGROUND_COLOR="#E5E5E5"   # Foreground (Text)

export CURSOR_COLOR="#16AFCA" # Cursor

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
