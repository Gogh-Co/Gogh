#!/usr/bin/env bash

export PROFILE_NAME="Darcula"

export COLOR_01="#2B2B2B"           # Black (Host)
export COLOR_02="#4EADE5"           # Red (Syntax string)
export COLOR_03="#6A8759"           # Green (Command)
export COLOR_04="#BBB529"           # Yellow (Command second)
export COLOR_05="#9876AA"           # Blue (Path)
export COLOR_06="#CC7832"           # Magenta (Syntax var)
export COLOR_07="#629755"           # Cyan (Prompt)
export COLOR_08="#A9B7C6"           # White

export COLOR_09="#606366"           # Bright Black
export COLOR_10="#4EADE5"           # Bright Red (Command error)
export COLOR_11="#6A8759"           # Bright Green (Exec)
export COLOR_12="#BBB529"           # Bright Yellow
export COLOR_13="#9876AA"           # Bright Blue (Folder)
export COLOR_14="#CC7832"           # Bright Magenta
export COLOR_15="#629755"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#2B2B2B"   # Background
export FOREGROUND_COLOR="#A9B7C6"   # Foreground (Text)

export CURSOR_COLOR="#A9B7C6" # Cursor

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
