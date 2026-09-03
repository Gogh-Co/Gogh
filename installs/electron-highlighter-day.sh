#!/usr/bin/env bash

export PROFILE_NAME="Electron Highlighter Day"

export COLOR_01="#C2C6D4"           # Black (Host)
export COLOR_02="#F52A65"           # Red (Syntax string)
export COLOR_03="#10A877"           # Green (Command)
export COLOR_04="#DF8E1D"           # Yellow (Command second)
export COLOR_05="#366FF0"           # Blue (Path)
export COLOR_06="#8B4FE0"           # Magenta (Syntax var)
export COLOR_07="#0A9FBF"           # Cyan (Prompt)
export COLOR_08="#59647E"           # White

export COLOR_09="#7B88A8"           # Bright Black
export COLOR_10="#F52A65"           # Bright Red (Command error)
export COLOR_11="#10A877"           # Bright Green (Exec)
export COLOR_12="#DF8E1D"           # Bright Yellow
export COLOR_13="#366FF0"           # Bright Blue (Folder)
export COLOR_14="#8B4FE0"           # Bright Magenta
export COLOR_15="#0A9FBF"           # Bright Cyan
export COLOR_16="#2F3B54"           # Bright White

export BACKGROUND_COLOR="#EEF0F5"   # Background
export FOREGROUND_COLOR="#2F3B54"   # Foreground (Text)

export CURSOR_COLOR="#2F3B54" # Cursor

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
