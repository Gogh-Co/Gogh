#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Glacier"

export COLOR_01="#C2D4E5"           # Black (Host)
export COLOR_02="#BD0F0F"           # Red (Syntax string)
export COLOR_03="#0FBD49"           # Green (Command)
export COLOR_04="#BDA00F"           # Yellow (Command second)
export COLOR_05="#0F58BD"           # Blue (Path)
export COLOR_06="#BD0FBD"           # Magenta (Syntax var)
export COLOR_07="#0FBDBD"           # Cyan (Prompt)
export COLOR_08="#080D17"           # White

export COLOR_09="#8DADCE"           # Bright Black
export COLOR_10="#EE2B2B"           # Bright Red (Command error)
export COLOR_11="#12D452"           # Bright Green (Exec)
export COLOR_12="#D4B312"           # Bright Yellow
export COLOR_13="#2B7CEE"           # Bright Blue (Folder)
export COLOR_14="#EE2BEE"           # Bright Magenta
export COLOR_15="#12D4D4"           # Bright Cyan
export COLOR_16="#0F172A"           # Bright White

export BACKGROUND_COLOR="#F8FAFC"   # Background
export FOREGROUND_COLOR="#0F172A"   # Foreground (Text)

export CURSOR_COLOR="#0EA5E9" # Cursor

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
