#!/usr/bin/env bash

export PROFILE_NAME="Noctis Lux"

export COLOR_01="#003B42"           # Black (Host)
export COLOR_02="#E34E1C"           # Red (Syntax string)
export COLOR_03="#00B368"           # Green (Command)
export COLOR_04="#F49725"           # Yellow (Command second)
export COLOR_05="#0094F0"           # Blue (Path)
export COLOR_06="#FF5792"           # Magenta (Syntax var)
export COLOR_07="#00BDD6"           # Cyan (Prompt)
export COLOR_08="#8CA6A6"           # White

export COLOR_09="#004D57"           # Bright Black
export COLOR_10="#FF4000"           # Bright Red (Command error)
export COLOR_11="#00D17A"           # Bright Green (Exec)
export COLOR_12="#FF8C00"           # Bright Yellow
export COLOR_13="#0FA3FF"           # Bright Blue (Folder)
export COLOR_14="#FF6B9F"           # Bright Magenta
export COLOR_15="#00CBE6"           # Bright Cyan
export COLOR_16="#BBC3C4"           # Bright White

export BACKGROUND_COLOR="#FEF8EC"   # Background
export FOREGROUND_COLOR="#005661"   # Foreground (Text)

export CURSOR_COLOR="#005661" # Cursor

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
