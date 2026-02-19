#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Classic F"

export COLOR_01="#1f211c"           # Black (Host)
export COLOR_02="#0b88d0"           # Red (Syntax string)
export COLOR_03="#a48f04"           # Green (Command)
export COLOR_04="#dcc218"           # Yellow (Command second)
export COLOR_05="#8bcf17"           # Blue (Path)
export COLOR_06="#15bc52"           # Magenta (Syntax var)
export COLOR_07="#c1aa15"           # Cyan (Prompt)
export COLOR_08="#ebeee8"           # White

export COLOR_09="#0b0d07"           # Bright Black
export COLOR_10="#47b5f5"           # Bright Red (Command error)
export COLOR_11="#e6ca1a"           # Bright Green (Exec)
export COLOR_12="#f2e58c"           # Bright Yellow
export COLOR_13="#ddf6b1"           # Bright Blue (Folder)
export COLOR_14="#18d85e"           # Bright Magenta
export COLOR_15="#cdf28c"           # Bright Cyan
export COLOR_16="#f8f9f6"           # Bright White

export BACKGROUND_COLOR="#1f211c"   # Background
export FOREGROUND_COLOR="#9ba191"   # Foreground (Text)

export CURSOR_COLOR="#85826f" # Cursor

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
