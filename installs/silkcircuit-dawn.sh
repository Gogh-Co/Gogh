#!/usr/bin/env bash

export PROFILE_NAME="SilkCircuit Dawn"

export COLOR_01="#2B2540"           # Black (Host)
export COLOR_02="#C1272D"           # Red (Syntax string)
export COLOR_03="#1D6E46"           # Green (Command)
export COLOR_04="#796100"           # Yellow (Command second)
export COLOR_05="#1454DC"           # Blue (Path)
export COLOR_06="#B40077"           # Magenta (Syntax var)
export COLOR_07="#006E72"           # Cyan (Prompt)
export COLOR_08="#FAF8FF"           # White

export COLOR_09="#5A4D6E"           # Bright Black
export COLOR_10="#DC2626"           # Bright Red (Command error)
export COLOR_11="#288855"           # Bright Green (Exec)
export COLOR_12="#7F5F00"           # Bright Yellow
export COLOR_13="#2572EF"           # Bright Blue (Folder)
export COLOR_14="#D92A99"           # Bright Magenta
export COLOR_15="#048397"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#FAF8FF"   # Background
export FOREGROUND_COLOR="#2B2540"   # Foreground (Text)

export CURSOR_COLOR="#006E72" # Cursor

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
