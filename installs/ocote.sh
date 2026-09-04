#!/usr/bin/env bash

export PROFILE_NAME="Ocote"

export COLOR_01="#14100C"           # Black (Host)
export COLOR_02="#E8635A"           # Red (Syntax string)
export COLOR_03="#7DC97A"           # Green (Command)
export COLOR_04="#E8B43A"           # Yellow (Command second)
export COLOR_05="#82A6E0"           # Blue (Path)
export COLOR_06="#C58AE0"           # Magenta (Syntax var)
export COLOR_07="#6DD8C8"           # Cyan (Prompt)
export COLOR_08="#E7DCC6"           # White

export COLOR_09="#6B6253"           # Bright Black
export COLOR_10="#E8635A"           # Bright Red (Command error)
export COLOR_11="#7DC97A"           # Bright Green (Exec)
export COLOR_12="#E8B43A"           # Bright Yellow
export COLOR_13="#82A6E0"           # Bright Blue (Folder)
export COLOR_14="#C58AE0"           # Bright Magenta
export COLOR_15="#6DD8C8"           # Bright Cyan
export COLOR_16="#FAF6EC"           # Bright White

export BACKGROUND_COLOR="#14100C"   # Background
export FOREGROUND_COLOR="#E7DCC6"   # Foreground (Text)

export CURSOR_COLOR="#E7DCC6" # Cursor

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
