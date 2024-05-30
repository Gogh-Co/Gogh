#!/usr/bin/env bash

export PROFILE_NAME="Papercolor Light"

export COLOR_01="#EEEEEE"           # Black (Host)
export COLOR_02="#AF0000"           # Red (Syntax string)
export COLOR_03="#008700"           # Green (Command)
export COLOR_04="#5F8700"           # Yellow (Command second)
export COLOR_05="#0087AF"           # Blue (Path)
export COLOR_06="#878787"           # Magenta (Syntax var)
export COLOR_07="#005F87"           # Cyan (Prompt)
export COLOR_08="#444444"           # White

export COLOR_09="#BCBCBC"           # Bright Black
export COLOR_10="#D70000"           # Bright Red (Command error)
export COLOR_11="#D70087"           # Bright Green (Exec)
export COLOR_12="#8700AF"           # Bright Yellow
export COLOR_13="#D75F00"           # Bright Blue (Folder)
export COLOR_14="#D75F00"           # Bright Magenta
export COLOR_15="#005FAF"           # Bright Cyan
export COLOR_16="#005F87"           # Bright White

export BACKGROUND_COLOR="#EEEEEE"   # Background
export FOREGROUND_COLOR="#444444"   # Foreground (Text)

export CURSOR_COLOR="#444444" # Cursor

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
