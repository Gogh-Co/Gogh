#!/usr/bin/env bash

export PROFILE_NAME="Oxocarbon"

export COLOR_01="#161616"           # Black (Host)
export COLOR_02="#3DDBD9"           # Red (Syntax string)
export COLOR_03="#33B1FF"           # Green (Command)
export COLOR_04="#EE5396"           # Yellow (Command second)
export COLOR_05="#42BE65"           # Blue (Path)
export COLOR_06="#BE95FF"           # Magenta (Syntax var)
export COLOR_07="#FF7EB6"           # Cyan (Prompt)
export COLOR_08="#F2F4F8"           # White

export COLOR_09="#585858"           # Bright Black
export COLOR_10="#3DDBD9"           # Bright Red (Command error)
export COLOR_11="#33B1FF"           # Bright Green (Exec)
export COLOR_12="#EE5396"           # Bright Yellow
export COLOR_13="#42BE65"           # Bright Blue (Folder)
export COLOR_14="#BE95FF"           # Bright Magenta
export COLOR_15="#FF7EB6"           # Bright Cyan
export COLOR_16="#F2F4F8"           # Bright White

export BACKGROUND_COLOR="#161616"   # Background
export FOREGROUND_COLOR="#F2F4F8"   # Foreground (Text)

export CURSOR_COLOR="#FFFFFF" # Cursor

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
