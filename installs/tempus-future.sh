#!/usr/bin/env bash

export PROFILE_NAME="Tempus Future"

export COLOR_01="#090a18"           # Black (Host)
export COLOR_02="#ff7e8f"           # Red (Syntax string)
export COLOR_03="#6aba39"           # Green (Command)
export COLOR_04="#bfa51a"           # Yellow (Command second)
export COLOR_05="#4ab2d7"           # Blue (Path)
export COLOR_06="#e58f84"           # Magenta (Syntax var)
export COLOR_07="#2ab7bb"           # Cyan (Prompt)
export COLOR_08="#a7a2c4"           # White

export COLOR_09="#2b1329"           # Bright Black
export COLOR_10="#f78e2f"           # Bright Red (Command error)
export COLOR_11="#60ba80"           # Bright Green (Exec)
export COLOR_12="#de9b1d"           # Bright Yellow
export COLOR_13="#8ba7ea"           # Bright Blue (Folder)
export COLOR_14="#e08bd6"           # Bright Magenta
export COLOR_15="#2cbab6"           # Bright Cyan
export COLOR_16="#b4abac"           # Bright White

export BACKGROUND_COLOR="#090a18"   # Background
export FOREGROUND_COLOR="#b4abac"   # Foreground (Text)

export CURSOR_COLOR="#b4abac" # Cursor

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
