#!/usr/bin/env bash

export PROFILE_NAME="Terminal Green 1999"

export COLOR_01="#32463A"           # Black (Host)
export COLOR_02="#FF5C7A"           # Red (Syntax string)
export COLOR_03="#22C55E"           # Green (Command)
export COLOR_04="#00D26A"           # Yellow (Command second)
export COLOR_05="#7DD3FC"           # Blue (Path)
export COLOR_06="#9DFF57"           # Magenta (Syntax var)
export COLOR_07="#39FF88"           # Cyan (Prompt)
export COLOR_08="#8FD6A9"           # White

export COLOR_09="#274335"           # Bright Black
export COLOR_10="#FF7D95"           # Bright Red (Command error)
export COLOR_11="#4ED17E"           # Bright Green (Exec)
export COLOR_12="#2EDA85"           # Bright Yellow
export COLOR_13="#97DCFD"           # Bright Blue (Folder)
export COLOR_14="#B1FF79"           # Bright Magenta
export COLOR_15="#61FFA0"           # Bright Cyan
export COLOR_16="#D8FFE6"           # Bright White

export BACKGROUND_COLOR="#03120A"   # Background
export FOREGROUND_COLOR="#D8FFE6"   # Foreground (Text)

export CURSOR_COLOR="#D8FFE6" # Cursor

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
