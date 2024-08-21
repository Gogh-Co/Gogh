#!/usr/bin/env bash

export PROFILE_NAME="Base2Tone Lavender"

export COLOR_01="#201d2a"           # Black (Host)
export COLOR_02="#9375f5"           # Red (Syntax string)
export COLOR_03="#d294ff"           # Green (Command)
export COLOR_04="#ecd1ff"           # Yellow (Command second)
export COLOR_05="#a286fd"           # Blue (Path)
export COLOR_06="#d294ff"           # Magenta (Syntax var)
export COLOR_07="#b5a0fe"           # Cyan (Prompt)
export COLOR_08="#9992b0"           # White

export COLOR_09="#625a7c"           # Bright Black
export COLOR_10="#dba8ff"           # Bright Red (Command error)
export COLOR_11="#2c2839"           # Bright Green (Exec)
export COLOR_12="#4b455f"           # Bright Yellow
export COLOR_13="#6e658b"           # Bright Blue (Folder)
export COLOR_14="#dcd2fe"           # Bright Magenta
export COLOR_15="#ca80ff"           # Bright Cyan
export COLOR_16="#efebff"           # Bright White

export BACKGROUND_COLOR="#201d2a"   # Background
export FOREGROUND_COLOR="#9992b0"   # Foreground (Text)

export CURSOR_COLOR="#b042ff" # Cursor

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
