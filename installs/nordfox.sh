#!/usr/bin/env bash

export PROFILE_NAME="Nordfox"

export COLOR_01="#3B4252"           # Black (Host)
export COLOR_02="#BF616A"           # Red (Syntax string)
export COLOR_03="#A3BE8C"           # Green (Command)
export COLOR_04="#EBCB8B"           # Yellow (Command second)
export COLOR_05="#81A1C1"           # Blue (Path)
export COLOR_06="#B48EAD"           # Magenta (Syntax var)
export COLOR_07="#88C0D0"           # Cyan (Prompt)
export COLOR_08="#E5E9F0"           # White

export COLOR_09="#465780"           # Bright Black
export COLOR_10="#D06F79"           # Bright Red (Command error)
export COLOR_11="#B1D196"           # Bright Green (Exec)
export COLOR_12="#F0D399"           # Bright Yellow
export COLOR_13="#8CAFD2"           # Bright Blue (Folder)
export COLOR_14="#C895BF"           # Bright Magenta
export COLOR_15="#93CCDC"           # Bright Cyan
export COLOR_16="#E7ECF4"           # Bright White

export BACKGROUND_COLOR="#2E3440"   # Background
export FOREGROUND_COLOR="#CDCECF"   # Foreground (Text)

export CURSOR_COLOR="#CDCECF" # Cursor

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
