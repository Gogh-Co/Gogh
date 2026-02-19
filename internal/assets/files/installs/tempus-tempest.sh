#!/usr/bin/env bash

export PROFILE_NAME="Tempus Tempest"

export COLOR_01="#282b2b"           # Black (Host)
export COLOR_02="#cfc80a"           # Red (Syntax string)
export COLOR_03="#7ad97a"           # Green (Command)
export COLOR_04="#bfcc4a"           # Yellow (Command second)
export COLOR_05="#60d7cd"           # Blue (Path)
export COLOR_06="#c5c4af"           # Magenta (Syntax var)
export COLOR_07="#8bd0bf"           # Cyan (Prompt)
export COLOR_08="#b0c8ca"           # White

export COLOR_09="#323535"           # Bright Black
export COLOR_10="#d1d933"           # Bright Red (Command error)
export COLOR_11="#99e299"           # Bright Green (Exec)
export COLOR_12="#bbde4f"           # Bright Yellow
export COLOR_13="#74e4cd"           # Bright Blue (Folder)
export COLOR_14="#d2d4aa"           # Bright Magenta
export COLOR_15="#9bdfc4"           # Bright Cyan
export COLOR_16="#b6e0ca"           # Bright White

export BACKGROUND_COLOR="#282b2b"   # Background
export FOREGROUND_COLOR="#b6e0ca"   # Foreground (Text)

export CURSOR_COLOR="#b6e0ca" # Cursor

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
