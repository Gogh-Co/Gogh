#!/usr/bin/env bash

export PROFILE_NAME="Aubade"

export COLOR_01="#33293F"           # Black (Host)
export COLOR_02="#C0303A"           # Red (Syntax string)
export COLOR_03="#2E7D6E"           # Green (Command)
export COLOR_04="#8C610C"           # Yellow (Command second)
export COLOR_05="#4A3CC0"           # Blue (Path)
export COLOR_06="#8A4BC0"           # Magenta (Syntax var)
export COLOR_07="#AE3F84"           # Cyan (Prompt)
export COLOR_08="#B2B2B2"           # White

export COLOR_09="#9A8FA8"           # Bright Black
export COLOR_10="#C0303A"           # Bright Red (Command error)
export COLOR_11="#2E7D6E"           # Bright Green (Exec)
export COLOR_12="#AE3F84"           # Bright Yellow
export COLOR_13="#4A3CC0"           # Bright Blue (Folder)
export COLOR_14="#D8B670"           # Bright Magenta
export COLOR_15="#AE3F84"           # Bright Cyan
export COLOR_16="#3A3340"           # Bright White

export BACKGROUND_COLOR="#FBF6FB"   # Background
export FOREGROUND_COLOR="#3A3340"   # Foreground (Text)

export CURSOR_COLOR="#AE3F84" # Cursor

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
