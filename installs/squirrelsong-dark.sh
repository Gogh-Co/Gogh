#!/usr/bin/env bash

export PROFILE_NAME="Squirrelsong Dark"

export COLOR_01="#352A21"           # Black (Host)
export COLOR_02="#AC493E"           # Red (Syntax string)
export COLOR_03="#558240"           # Green (Command)
export COLOR_04="#CEB250"           # Yellow (Command second)
export COLOR_05="#5993C2"           # Blue (Path)
export COLOR_06="#7F61B3"           # Magenta (Syntax var)
export COLOR_07="#4F9593"           # Cyan (Prompt)
export COLOR_08="#CFBAA5"           # White

export COLOR_09="#6B503C"           # Bright Black
export COLOR_10="#CE574A"           # Bright Red (Command error)
export COLOR_11="#719955"           # Bright Green (Exec)
export COLOR_12="#E2C358"           # Bright Yellow
export COLOR_13="#63A2D6"           # Bright Blue (Folder)
export COLOR_14="#9672D4"           # Bright Magenta
export COLOR_15="#72AAA8"           # Bright Cyan
export COLOR_16="#EDD5BE"           # Bright White

export BACKGROUND_COLOR="#352A21"   # Background
export FOREGROUND_COLOR="#AD9C8B"   # Foreground (Text)

export CURSOR_COLOR="#AD9C8B" # Cursor

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
