#!/usr/bin/env bash

export PROFILE_NAME="Space Grey Eighties Dull"

export COLOR_01="#15171C"           # Black (Host)
export COLOR_02="#B14956"           # Red (Syntax string)
export COLOR_03="#91B377"           # Green (Command)
export COLOR_04="#5485C0"           # Yellow (Command second)
export COLOR_05="#7B8FA4"           # Blue (Path)
export COLOR_06="#A5779E"           # Magenta (Syntax var)
export COLOR_07="#7FCCCB"           # Cyan (Prompt)
export COLOR_08="#B2B8C2"           # White

export COLOR_09="#555555"           # Bright Black
export COLOR_10="#EC5F67"           # Bright Red (Command error)
export COLOR_11="#88E985"           # Bright Green (Exec)
export COLOR_12="#FDC253"           # Bright Yellow
export COLOR_13="#5485C0"           # Bright Blue (Folder)
export COLOR_14="#BF83C0"           # Bright Magenta
export COLOR_15="#58C2C0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#212121"   # Background
export FOREGROUND_COLOR="#9A9FA6"   # Foreground (Text)

export CURSOR_COLOR="#9A9FA6" # Cursor

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
