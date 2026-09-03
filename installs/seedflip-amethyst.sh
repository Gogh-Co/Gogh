#!/usr/bin/env bash

export PROFILE_NAME="SeedFlip Amethyst"

export COLOR_01="#D7D1CB"           # Black (Host)
export COLOR_02="#BD0F0F"           # Red (Syntax string)
export COLOR_03="#0FBD49"           # Green (Command)
export COLOR_04="#BDA00F"           # Yellow (Command second)
export COLOR_05="#0F58BD"           # Blue (Path)
export COLOR_06="#BD0FBD"           # Magenta (Syntax var)
export COLOR_07="#0FBDBD"           # Cyan (Prompt)
export COLOR_08="#0E0519"           # White

export COLOR_09="#B5ABA0"           # Bright Black
export COLOR_10="#EE2B2B"           # Bright Red (Command error)
export COLOR_11="#12D452"           # Bright Green (Exec)
export COLOR_12="#D4B312"           # Bright Yellow
export COLOR_13="#2B7CEE"           # Bright Blue (Folder)
export COLOR_14="#EE2BEE"           # Bright Magenta
export COLOR_15="#05C8C8"           # Bright Cyan
export COLOR_16="#1A0A2E"           # Bright White

export BACKGROUND_COLOR="#F8F7F6"   # Background
export FOREGROUND_COLOR="#1A0A2E"   # Foreground (Text)

export CURSOR_COLOR="#635BFF" # Cursor

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
