#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic B"

export COLOR_01="#211e1c"           # Black (Host)
export COLOR_02="#669f04"           # Red (Syntax string)
export COLOR_03="#de5745"           # Green (Command)
export COLOR_04="#f18c7e"           # Yellow (Command second)
export COLOR_05="#e78b55"           # Blue (Path)
export COLOR_06="#c1aa15"           # Magenta (Syntax var)
export COLOR_07="#e97263"           # Cyan (Prompt)
export COLOR_08="#eeeae8"           # White

export COLOR_09="#0d0907"           # Bright Black
export COLOR_10="#8bcf17"           # Bright Red (Command error)
export COLOR_11="#f39c91"           # Bright Green (Exec)
export COLOR_12="#fbbab1"           # Bright Yellow
export COLOR_13="#f7cdb6"           # Bright Blue (Folder)
export COLOR_14="#dcc218"           # Bright Magenta
export COLOR_15="#f5c1a3"           # Bright Cyan
export COLOR_16="#f9f7f6"           # Bright White

export BACKGROUND_COLOR="#211e1c"   # Background
export FOREGROUND_COLOR="#a29790"   # Foreground (Text)

export CURSOR_COLOR="#847371" # Cursor

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
