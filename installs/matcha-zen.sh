#!/usr/bin/env bash

export PROFILE_NAME="Matcha Zen"

export COLOR_01="#354029"           # Black (Host)
export COLOR_02="#C2452A"           # Red (Syntax string)
export COLOR_03="#4E8C2E"           # Green (Command)
export COLOR_04="#927000"           # Yellow (Command second)
export COLOR_05="#2E7C78"           # Blue (Path)
export COLOR_06="#7E5BA6"           # Magenta (Syntax var)
export COLOR_07="#2A8585"           # Cyan (Prompt)
export COLOR_08="#56664A"           # White

export COLOR_09="#97A887"           # Bright Black
export COLOR_10="#C2452A"           # Bright Red (Command error)
export COLOR_11="#4E8C2E"           # Bright Green (Exec)
export COLOR_12="#B05A1E"           # Bright Yellow
export COLOR_13="#2E7C78"           # Bright Blue (Folder)
export COLOR_14="#7E5BA6"           # Bright Magenta
export COLOR_15="#2A8585"           # Bright Cyan
export COLOR_16="#354029"           # Bright White

export BACKGROUND_COLOR="#F5F7EA"   # Background
export FOREGROUND_COLOR="#354029"   # Foreground (Text)

export CURSOR_COLOR="#4E8C2E" # Cursor

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
