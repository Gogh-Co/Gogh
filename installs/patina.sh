#!/usr/bin/env bash

export PROFILE_NAME="Patina"

export COLOR_01="#16201C"           # Black (Host)
export COLOR_02="#D9603F"           # Red (Syntax string)
export COLOR_03="#9FC08C"           # Green (Command)
export COLOR_04="#C8A24A"           # Yellow (Command second)
export COLOR_05="#5FC9B0"           # Blue (Path)
export COLOR_06="#D7B45A"           # Magenta (Syntax var)
export COLOR_07="#7FD0C0"           # Cyan (Prompt)
export COLOR_08="#DCE5DE"           # White

export COLOR_09="#5C7068"           # Bright Black
export COLOR_10="#DF785C"           # Bright Red (Command error)
export COLOR_11="#ABC89A"           # Bright Green (Exec)
export COLOR_12="#D98E5A"           # Bright Yellow
export COLOR_13="#5FC9B0"           # Bright Blue (Folder)
export COLOR_14="#E0C36A"           # Bright Magenta
export COLOR_15="#8ED6C8"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0E1613"   # Background
export FOREGROUND_COLOR="#DCE5DE"   # Foreground (Text)

export CURSOR_COLOR="#E0C36A" # Cursor

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
