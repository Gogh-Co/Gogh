#!/usr/bin/env bash

export PROFILE_NAME="Doom Peacock"

export COLOR_01="#1C1F24"           # Black (Host)
export COLOR_02="#CB4B16"           # Red (Syntax string)
export COLOR_03="#26A6A6"           # Green (Command)
export COLOR_04="#BCD42A"           # Yellow (Command second)
export COLOR_05="#2A6CC6"           # Blue (Path)
export COLOR_06="#A9A1E1"           # Magenta (Syntax var)
export COLOR_07="#5699AF"           # Cyan (Prompt)
export COLOR_08="#EDE0CE"           # White

export COLOR_09="#2B2A27"           # Bright Black
export COLOR_10="#FF5D38"           # Bright Red (Command error)
export COLOR_11="#98BE65"           # Bright Green (Exec)
export COLOR_12="#E6F972"           # Bright Yellow
export COLOR_13="#51AFEF"           # Bright Blue (Folder)
export COLOR_14="#C678DD"           # Bright Magenta
export COLOR_15="#46D9FF"           # Bright Cyan
export COLOR_16="#DFDFDF"           # Bright White

export BACKGROUND_COLOR="#2B2A27"   # Background
export FOREGROUND_COLOR="#EDE0CE"   # Foreground (Text)

export CURSOR_COLOR="#9C9C9D" # Cursor

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
