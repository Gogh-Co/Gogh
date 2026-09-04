#!/usr/bin/env bash

export PROFILE_NAME="Chicago Day"

export COLOR_01="#E8F0EA"           # Black (Host)
export COLOR_02="#C60C30"           # Red (Syntax string)
export COLOR_03="#009B3A"           # Green (Command)
export COLOR_04="#968400"           # Yellow (Command second)
export COLOR_05="#522398"           # Blue (Path)
export COLOR_06="#E27EA6"           # Magenta (Syntax var)
export COLOR_07="#00A1DE"           # Cyan (Prompt)
export COLOR_08="#364C40"           # White

export COLOR_09="#8A9A91"           # Bright Black
export COLOR_10="#C60C30"           # Bright Red (Command error)
export COLOR_11="#009B3A"           # Bright Green (Exec)
export COLOR_12="#968400"           # Bright Yellow
export COLOR_13="#522398"           # Bright Blue (Folder)
export COLOR_14="#E27EA6"           # Bright Magenta
export COLOR_15="#00A1DE"           # Bright Cyan
export COLOR_16="#1E2A24"           # Bright White

export BACKGROUND_COLOR="#E8F0EA"   # Background
export FOREGROUND_COLOR="#364C40"   # Foreground (Text)

export CURSOR_COLOR="#364C40" # Cursor

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
