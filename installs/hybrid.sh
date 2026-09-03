#!/usr/bin/env bash

export PROFILE_NAME="Hybrid"

export COLOR_01="#2A2E33"           # Black (Host)
export COLOR_02="#B84D51"           # Red (Syntax string)
export COLOR_03="#B3BF5A"           # Green (Command)
export COLOR_04="#E4B55E"           # Yellow (Command second)
export COLOR_05="#6E90B0"           # Blue (Path)
export COLOR_06="#A17EAC"           # Magenta (Syntax var)
export COLOR_07="#7FBFB4"           # Cyan (Prompt)
export COLOR_08="#B5B9B6"           # White

export COLOR_09="#1D1F22"           # Bright Black
export COLOR_10="#8D2E32"           # Bright Red (Command error)
export COLOR_11="#798431"           # Bright Green (Exec)
export COLOR_12="#E58A50"           # Bright Yellow
export COLOR_13="#4B6B88"           # Bright Blue (Folder)
export COLOR_14="#6E5079"           # Bright Magenta
export COLOR_15="#4D7B74"           # Bright Cyan
export COLOR_16="#5A626A"           # Bright White

export BACKGROUND_COLOR="#161719"   # Background
export FOREGROUND_COLOR="#B7BCBA"   # Foreground (Text)

export CURSOR_COLOR="#B7BCBA" # Cursor

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
