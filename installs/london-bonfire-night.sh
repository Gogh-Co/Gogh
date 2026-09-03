#!/usr/bin/env bash

export PROFILE_NAME="London Bonfire Night"

export COLOR_01="#1A1418"           # Black (Host)
export COLOR_02="#D65A3A"           # Red (Syntax string)
export COLOR_03="#6A8A4A"           # Green (Command)
export COLOR_04="#E8B048"           # Yellow (Command second)
export COLOR_05="#5A7AB8"           # Blue (Path)
export COLOR_06="#D76AA8"           # Magenta (Syntax var)
export COLOR_07="#88A8C8"           # Cyan (Prompt)
export COLOR_08="#E8E0C8"           # White

export COLOR_09="#44403C"           # Bright Black
export COLOR_10="#EC7654"           # Bright Red (Command error)
export COLOR_11="#88A868"           # Bright Green (Exec)
export COLOR_12="#F5C25C"           # Bright Yellow
export COLOR_13="#7A96D0"           # Bright Blue (Folder)
export COLOR_14="#ED85BC"           # Bright Magenta
export COLOR_15="#A0BCD6"           # Bright Cyan
export COLOR_16="#FDF6DF"           # Bright White

export BACKGROUND_COLOR="#0E0C0E"   # Background
export FOREGROUND_COLOR="#E8E0C8"   # Foreground (Text)

export CURSOR_COLOR="#E85AA8" # Cursor

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
