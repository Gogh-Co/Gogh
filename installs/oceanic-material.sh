#!/usr/bin/env bash

export PROFILE_NAME="Oceanic Material"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#EE2B2A"           # Red (Syntax string)
export COLOR_03="#40A33F"           # Green (Command)
export COLOR_04="#FFEA2E"           # Yellow (Command second)
export COLOR_05="#1E80F0"           # Blue (Path)
export COLOR_06="#8800A0"           # Magenta (Syntax var)
export COLOR_07="#16AFCA"           # Cyan (Prompt)
export COLOR_08="#A4A4A4"           # White

export COLOR_09="#777777"           # Bright Black
export COLOR_10="#DC5C60"           # Bright Red (Command error)
export COLOR_11="#70BE71"           # Bright Green (Exec)
export COLOR_12="#FFF163"           # Bright Yellow
export COLOR_13="#54A4F3"           # Bright Blue (Folder)
export COLOR_14="#AA4DBC"           # Bright Magenta
export COLOR_15="#42C7DA"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1C262B"   # Background
export FOREGROUND_COLOR="#C2C8D7"   # Foreground (Text)

export CURSOR_COLOR="#B3B8C3" # Cursor

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
