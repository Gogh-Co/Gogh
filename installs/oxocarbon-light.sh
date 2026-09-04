#!/usr/bin/env bash

export PROFILE_NAME="Oxocarbon Light"

export COLOR_01="#F2F4F8"           # Black (Host)
export COLOR_02="#FF7EB6"           # Red (Syntax string)
export COLOR_03="#42BE65"           # Green (Command)
export COLOR_04="#FF6F00"           # Yellow (Command second)
export COLOR_05="#0F62FE"           # Blue (Path)
export COLOR_06="#BE95FF"           # Magenta (Syntax var)
export COLOR_07="#673AB7"           # Cyan (Prompt)
export COLOR_08="#525F70"           # White

export COLOR_09="#A1ACBA"           # Bright Black
export COLOR_10="#FF7EB6"           # Bright Red (Command error)
export COLOR_11="#42BE65"           # Bright Green (Exec)
export COLOR_12="#FF6F00"           # Bright Yellow
export COLOR_13="#0F62FE"           # Bright Blue (Folder)
export COLOR_14="#BE95FF"           # Bright Magenta
export COLOR_15="#673AB7"           # Bright Cyan
export COLOR_16="#272D35"           # Bright White

export BACKGROUND_COLOR="#F2F4F8"   # Background
export FOREGROUND_COLOR="#525F70"   # Foreground (Text)

export CURSOR_COLOR="#525F70" # Cursor

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
