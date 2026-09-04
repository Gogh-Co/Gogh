#!/usr/bin/env bash

export PROFILE_NAME="Paradiso Dark"

export COLOR_01="#553A63"           # Black (Host)
export COLOR_02="#8EB8DB"           # Red (Syntax string)
export COLOR_03="#8E92DB"           # Green (Command)
export COLOR_04="#9157CC"           # Yellow (Command second)
export COLOR_05="#4660A0"           # Blue (Path)
export COLOR_06="#DB74E0"           # Magenta (Syntax var)
export COLOR_07="#68ACC1"           # Cyan (Prompt)
export COLOR_08="#B8D0DB"           # White

export COLOR_09="#6F4C82"           # Bright Black
export COLOR_10="#C2E1FC"           # Bright Red (Command error)
export COLOR_11="#C2C4FC"           # Bright Green (Exec)
export COLOR_12="#C68FFC"           # Bright Yellow
export COLOR_13="#5D8AFC"           # Bright Blue (Folder)
export COLOR_14="#F8AEFC"           # Bright Magenta
export COLOR_15="#99E5FC"           # Bright Cyan
export COLOR_16="#CCEBF9"           # Bright White

export BACKGROUND_COLOR="#302138"   # Background
export FOREGROUND_COLOR="#B8D0DB"   # Foreground (Text)

export CURSOR_COLOR="#B8D0DB" # Cursor

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
