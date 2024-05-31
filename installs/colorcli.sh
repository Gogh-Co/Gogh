#!/usr/bin/env bash

export PROFILE_NAME="Colorcli"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#D70000"           # Red (Syntax string)
export COLOR_03="#5FAF00"           # Green (Command)
export COLOR_04="#5FAF00"           # Yellow (Command second)
export COLOR_05="#005F87"           # Blue (Path)
export COLOR_06="#D70000"           # Magenta (Syntax var)
export COLOR_07="#5F5F5F"           # Cyan (Prompt)
export COLOR_08="#E4E4E4"           # White

export COLOR_09="#5F5F5F"           # Bright Black
export COLOR_10="#D70000"           # Bright Red (Command error)
export COLOR_11="#5F5F5F"           # Bright Green (Exec)
export COLOR_12="#FFFF00"           # Bright Yellow
export COLOR_13="#0087AF"           # Bright Blue (Folder)
export COLOR_14="#0087AF"           # Bright Magenta
export COLOR_15="#0087AF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FFFFFF"   # Background
export FOREGROUND_COLOR="#005F87"   # Foreground (Text)

export CURSOR_COLOR="#005F87" # Cursor

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
