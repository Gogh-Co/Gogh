#!/usr/bin/env bash

export PROFILE_NAME="Measured Light"

export COLOR_01="#FDF9F5"           # Black (Host)
export COLOR_02="#AC1F35"           # Red (Syntax string)
export COLOR_03="#0C680C"           # Green (Command)
export COLOR_04="#645A00"           # Yellow (Command second)
export COLOR_05="#0158AD"           # Blue (Path)
export COLOR_06="#6645C2"           # Magenta (Syntax var)
export COLOR_07="#01716F"           # Cyan (Prompt)
export COLOR_08="#292929"           # White

export COLOR_09="#5A5A5A"           # Bright Black
export COLOR_10="#AC1F35"           # Bright Red (Command error)
export COLOR_11="#0C680C"           # Bright Green (Exec)
export COLOR_12="#645A00"           # Bright Yellow
export COLOR_13="#0158AD"           # Bright Blue (Folder)
export COLOR_14="#6645C2"           # Bright Magenta
export COLOR_15="#01716F"           # Bright Cyan
export COLOR_16="#000000"           # Bright White

export BACKGROUND_COLOR="#FDF9F5"   # Background
export FOREGROUND_COLOR="#292929"   # Foreground (Text)

export CURSOR_COLOR="#292929" # Cursor

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
