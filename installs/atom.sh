#!/usr/bin/env bash

export PROFILE_NAME="Atom"

export COLOR_01="#000000"           # Black (Host)
export COLOR_02="#FD5FF1"           # Red (Syntax string)
export COLOR_03="#87C38A"           # Green (Command)
export COLOR_04="#FFD7B1"           # Yellow (Command second)
export COLOR_05="#85BEFD"           # Blue (Path)
export COLOR_06="#B9B6FC"           # Magenta (Syntax var)
export COLOR_07="#85BEFD"           # Cyan (Prompt)
export COLOR_08="#E0E0E0"           # White

export COLOR_09="#000000"           # Bright Black
export COLOR_10="#FD5FF1"           # Bright Red (Command error)
export COLOR_11="#94FA36"           # Bright Green (Exec)
export COLOR_12="#F5FFA8"           # Bright Yellow
export COLOR_13="#96CBFE"           # Bright Blue (Folder)
export COLOR_14="#B9B6FC"           # Bright Magenta
export COLOR_15="#85BEFD"           # Bright Cyan
export COLOR_16="#E0E0E0"           # Bright White

export BACKGROUND_COLOR="#161719"   # Background
export FOREGROUND_COLOR="#C5C8C6"   # Foreground (Text)

export CURSOR_COLOR="#C5C8C6" # Cursor

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
