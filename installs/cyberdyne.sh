#!/usr/bin/env bash

export PROFILE_NAME="Cyberdyne"

export COLOR_01="#080808"           # Black (Host)
export COLOR_02="#FF8373"           # Red (Syntax string)
export COLOR_03="#00C172"           # Green (Command)
export COLOR_04="#D2A700"           # Yellow (Command second)
export COLOR_05="#0071CF"           # Blue (Path)
export COLOR_06="#FF90FE"           # Magenta (Syntax var)
export COLOR_07="#6BFFDD"           # Cyan (Prompt)
export COLOR_08="#F1F1F1"           # White

export COLOR_09="#2E2E2E"           # Bright Black
export COLOR_10="#FFC4BE"           # Bright Red (Command error)
export COLOR_11="#D6FCBA"           # Bright Green (Exec)
export COLOR_12="#FFFED5"           # Bright Yellow
export COLOR_13="#C2E3FF"           # Bright Blue (Folder)
export COLOR_14="#FFB2FE"           # Bright Magenta
export COLOR_15="#E6E7FE"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#151144"   # Background
export FOREGROUND_COLOR="#00FF92"   # Foreground (Text)

export CURSOR_COLOR="#00FF9C" # Cursor

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
