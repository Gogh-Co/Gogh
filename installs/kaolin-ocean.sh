#!/usr/bin/env bash

export PROFILE_NAME="Kaolin Ocean"

export COLOR_01="#14141E"           # Black (Host)
export COLOR_02="#E84C58"           # Red (Syntax string)
export COLOR_03="#35BF88"           # Green (Command)
export COLOR_04="#DBAC66"           # Yellow (Command second)
export COLOR_05="#4CA6E8"           # Blue (Path)
export COLOR_06="#C79AF4"           # Magenta (Syntax var)
export COLOR_07="#6BD9DB"           # Cyan (Prompt)
export COLOR_08="#E6E6E8"           # White

export COLOR_09="#545C5E"           # Bright Black
export COLOR_10="#E84C58"           # Bright Red (Command error)
export COLOR_11="#7CF083"           # Bright Green (Exec)
export COLOR_12="#EED891"           # Bright Yellow
export COLOR_13="#53859D"           # Bright Blue (Folder)
export COLOR_14="#CEA2CA"           # Bright Magenta
export COLOR_15="#4D9391"           # Bright Cyan
export COLOR_16="#BEBEC4"           # Bright White

export BACKGROUND_COLOR="#14141E"   # Background
export FOREGROUND_COLOR="#E6E6E8"   # Foreground (Text)

export CURSOR_COLOR="#E6E6E8" # Cursor

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
