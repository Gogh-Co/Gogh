#!/usr/bin/env bash

export PROFILE_NAME="Heetch Light"

export COLOR_01="#FEFFFF"           # Black (Host)
export COLOR_02="#F80059"           # Red (Syntax string)
export COLOR_03="#5BB66A"           # Green (Command)
export COLOR_04="#BD9701"           # Yellow (Command second)
export COLOR_05="#5BA2B6"           # Blue (Path)
export COLOR_06="#8F6C97"           # Magenta (Syntax var)
export COLOR_07="#47F9F5"           # Cyan (Prompt)
export COLOR_08="#5A496E"           # White

export COLOR_09="#9C92A8"           # Bright Black
export COLOR_10="#F80059"           # Bright Red (Command error)
export COLOR_11="#5BB66A"           # Bright Green (Exec)
export COLOR_12="#BD9701"           # Bright Yellow
export COLOR_13="#5BA2B6"           # Bright Blue (Folder)
export COLOR_14="#8F6C97"           # Bright Magenta
export COLOR_15="#47F9F5"           # Bright Cyan
export COLOR_16="#190134"           # Bright White

export BACKGROUND_COLOR="#FEFFFF"   # Background
export FOREGROUND_COLOR="#5A496E"   # Foreground (Text)

export CURSOR_COLOR="#5A496E" # Cursor

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
