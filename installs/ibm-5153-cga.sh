#!/usr/bin/env bash

export PROFILE_NAME="IBM 5153 CGA"

export COLOR_01="#141414"           # Black (Host)
export COLOR_02="#D03333"           # Red (Syntax string)
export COLOR_03="#1BD01B"           # Green (Command)
export COLOR_04="#D08C1B"           # Yellow (Command second)
export COLOR_05="#1B1BD0"           # Blue (Path)
export COLOR_06="#D01BD0"           # Magenta (Syntax var)
export COLOR_07="#1BD0D0"           # Cyan (Prompt)
export COLOR_08="#CECECE"           # White

export COLOR_09="#4E4E4E"           # Bright Black
export COLOR_10="#DC4E4E"           # Bright Red (Command error)
export COLOR_11="#4EDC4E"           # Bright Green (Exec)
export COLOR_12="#F3F34E"           # Bright Yellow
export COLOR_13="#4E4EDC"           # Bright Blue (Folder)
export COLOR_14="#F34EF3"           # Bright Magenta
export COLOR_15="#4EF3F3"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#141414"   # Background
export FOREGROUND_COLOR="#CECECE"   # Foreground (Text)

export CURSOR_COLOR="#CECECE" # Cursor

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
