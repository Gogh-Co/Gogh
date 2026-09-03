#!/usr/bin/env bash

export PROFILE_NAME="Blue Moon"

export COLOR_01="#353B52"           # Black (Host)
export COLOR_02="#D06178"           # Red (Syntax string)
export COLOR_03="#B4C4B4"           # Green (Command)
export COLOR_04="#CFCFBF"           # Yellow (Command second)
export COLOR_05="#959DCB"           # Blue (Path)
export COLOR_06="#B9A3EB"           # Magenta (Syntax var)
export COLOR_07="#89BBDD"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#8796B0"           # Bright Black
export COLOR_10="#E61F44"           # Bright Red (Command error)
export COLOR_11="#ACFAB4"           # Bright Green (Exec)
export COLOR_12="#DFDF9F"           # Bright Yellow
export COLOR_13="#B8BCF3"           # Bright Blue (Folder)
export COLOR_14="#B9A3EB"           # Bright Magenta
export COLOR_15="#89DDFF"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1B1E2B"   # Background
export FOREGROUND_COLOR="#676E96"   # Foreground (Text)

export CURSOR_COLOR="#676E96" # Cursor

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
