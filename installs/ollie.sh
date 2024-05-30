#!/usr/bin/env bash

export PROFILE_NAME="Ollie"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#AC2E31"           # Red (Syntax string)
export COLOR_03="#31AC61"           # Green (Command)
export COLOR_04="#AC4300"           # Yellow (Command second)
export COLOR_05="#2D57AC"           # Blue (Path)
export COLOR_06="#B08528"           # Magenta (Syntax var)
export COLOR_07="#1FA6AC"           # Cyan (Prompt)
export COLOR_08="#8A8EAC"           # White

export COLOR_09="#5B3725"           # Bright Black
export COLOR_10="#FF3D48"           # Bright Red (Command error)
export COLOR_11="#3BFF99"           # Bright Green (Exec)
export COLOR_12="#FF5E1E"           # Bright Yellow
export COLOR_13="#4488FF"           # Bright Blue (Folder)
export COLOR_14="#FFC21D"           # Bright Magenta
export COLOR_15="#1FFAFF"           # Bright Cyan
export COLOR_16="#5B6EA7"           # Bright White

export BACKGROUND_COLOR="#222125"   # Background
export FOREGROUND_COLOR="#8A8DAE"   # Foreground (Text)

export CURSOR_COLOR="#8A8DAE" # Cursor

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
