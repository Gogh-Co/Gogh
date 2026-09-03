#!/usr/bin/env bash

export PROFILE_NAME="Shokunin"

export COLOR_01="#303841"           # Black (Host)
export COLOR_02="#C84053"           # Red (Syntax string)
export COLOR_03="#157A5B"           # Green (Command)
export COLOR_04="#9A6000"           # Yellow (Command second)
export COLOR_05="#006FAE"           # Blue (Path)
export COLOR_06="#8F4155"           # Magenta (Syntax var)
export COLOR_07="#006C7F"           # Cyan (Prompt)
export COLOR_08="#F5F1E7"           # White

export COLOR_09="#777269"           # Bright Black
export COLOR_10="#D95A66"           # Bright Red (Command error)
export COLOR_11="#1B8E6A"           # Bright Green (Exec)
export COLOR_12="#B67608"           # Bright Yellow
export COLOR_13="#0084C7"           # Bright Blue (Folder)
export COLOR_14="#A75B73"           # Bright Magenta
export COLOR_15="#008396"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FCFAF2"   # Background
export FOREGROUND_COLOR="#303841"   # Foreground (Text)

export CURSOR_COLOR="#3A3E44" # Cursor

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
