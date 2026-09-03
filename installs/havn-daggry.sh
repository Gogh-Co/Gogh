#!/usr/bin/env bash

export PROFILE_NAME="Havn Daggry"

export COLOR_01="#212840"           # Black (Host)
export COLOR_02="#8F564B"           # Red (Syntax string)
export COLOR_03="#5C705B"           # Green (Command)
export COLOR_04="#B36F00"           # Yellow (Command second)
export COLOR_05="#40567A"           # Blue (Path)
export COLOR_06="#775D93"           # Magenta (Syntax var)
export COLOR_07="#8A5A7E"           # Cyan (Prompt)
export COLOR_08="#D7DBEA"           # White

export COLOR_09="#212840"           # Bright Black
export COLOR_10="#BD533E"           # Bright Red (Command error)
export COLOR_11="#79957B"           # Bright Green (Exec)
export COLOR_12="#F3B550"           # Bright Yellow
export COLOR_13="#6988BC"           # Bright Blue (Folder)
export COLOR_14="#7B7393"           # Bright Magenta
export COLOR_15="#A4879C"           # Bright Cyan
export COLOR_16="#D7DBEA"           # Bright White

export BACKGROUND_COLOR="#F8F9FB"   # Background
export FOREGROUND_COLOR="#3E4A77"   # Foreground (Text)

export CURSOR_COLOR="#386A51" # Cursor

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
