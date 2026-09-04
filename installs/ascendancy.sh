#!/usr/bin/env bash

export PROFILE_NAME="Ascendancy"

export COLOR_01="#282828"           # Black (Host)
export COLOR_02="#D05000"           # Red (Syntax string)
export COLOR_03="#B8BB26"           # Green (Command)
export COLOR_04="#FFCC1B"           # Yellow (Command second)
export COLOR_05="#458588"           # Blue (Path)
export COLOR_06="#FABD2F"           # Magenta (Syntax var)
export COLOR_07="#8F3F71"           # Cyan (Prompt)
export COLOR_08="#D5C7A1"           # White

export COLOR_09="#928374"           # Bright Black
export COLOR_10="#D05000"           # Bright Red (Command error)
export COLOR_11="#B8BB26"           # Bright Green (Exec)
export COLOR_12="#FFCC1B"           # Bright Yellow
export COLOR_13="#458588"           # Bright Blue (Folder)
export COLOR_14="#FABD2F"           # Bright Magenta
export COLOR_15="#8F3F71"           # Bright Cyan
export COLOR_16="#FBF1C7"           # Bright White

export BACKGROUND_COLOR="#282828"   # Background
export FOREGROUND_COLOR="#D5C7A1"   # Foreground (Text)

export CURSOR_COLOR="#D5C7A1" # Cursor

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
