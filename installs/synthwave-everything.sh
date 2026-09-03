#!/usr/bin/env bash

export PROFILE_NAME="Synthwave Everything"

export COLOR_01="#FEFEFE"           # Black (Host)
export COLOR_02="#F97E72"           # Red (Syntax string)
export COLOR_03="#72F1B8"           # Green (Command)
export COLOR_04="#FEDE5D"           # Yellow (Command second)
export COLOR_05="#6D77B3"           # Blue (Path)
export COLOR_06="#C792EA"           # Magenta (Syntax var)
export COLOR_07="#F772E0"           # Cyan (Prompt)
export COLOR_08="#FEFEFE"           # White

export COLOR_09="#FEFEFE"           # Bright Black
export COLOR_10="#F88414"           # Bright Red (Command error)
export COLOR_11="#72F1B8"           # Bright Green (Exec)
export COLOR_12="#FFF951"           # Bright Yellow
export COLOR_13="#36F9F6"           # Bright Blue (Folder)
export COLOR_14="#E1ACFF"           # Bright Magenta
export COLOR_15="#F92AAD"           # Bright Cyan
export COLOR_16="#FEFEFE"           # Bright White

export BACKGROUND_COLOR="#2A2139"   # Background
export FOREGROUND_COLOR="#F0EFF1"   # Foreground (Text)

export CURSOR_COLOR="#72F1B8" # Cursor

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
