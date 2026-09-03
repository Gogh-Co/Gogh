#!/usr/bin/env bash

export PROFILE_NAME="No Clown Fiesta"

export COLOR_01="#151515"           # Black (Host)
export COLOR_02="#B46958"           # Red (Syntax string)
export COLOR_03="#90A959"           # Green (Command)
export COLOR_04="#F4BF75"           # Yellow (Command second)
export COLOR_05="#BAD7FF"           # Blue (Path)
export COLOR_06="#AA759F"           # Magenta (Syntax var)
export COLOR_07="#88AFA2"           # Cyan (Prompt)
export COLOR_08="#E1E1E1"           # White

export COLOR_09="#727272"           # Bright Black
export COLOR_10="#7E97AB"           # Bright Red (Command error)
export COLOR_11="#90A959"           # Bright Green (Exec)
export COLOR_12="#F4BF75"           # Bright Yellow
export COLOR_13="#BAD7FF"           # Bright Blue (Folder)
export COLOR_14="#AA759F"           # Bright Magenta
export COLOR_15="#88AFA2"           # Bright Cyan
export COLOR_16="#AFAFAF"           # Bright White

export BACKGROUND_COLOR="#101010"   # Background
export FOREGROUND_COLOR="#E0E1E4"   # Foreground (Text)

export CURSOR_COLOR="#E0E1E4" # Cursor

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
