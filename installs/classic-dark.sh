#!/usr/bin/env bash

export PROFILE_NAME="Classic Dark"

export COLOR_01="#151515"           # Black (Host)
export COLOR_02="#AC4142"           # Red (Syntax string)
export COLOR_03="#90A959"           # Green (Command)
export COLOR_04="#F4BF75"           # Yellow (Command second)
export COLOR_05="#6A9FB5"           # Blue (Path)
export COLOR_06="#AA759F"           # Magenta (Syntax var)
export COLOR_07="#75B5AA"           # Cyan (Prompt)
export COLOR_08="#D0D0D0"           # White

export COLOR_09="#505050"           # Bright Black
export COLOR_10="#AC4142"           # Bright Red (Command error)
export COLOR_11="#90A959"           # Bright Green (Exec)
export COLOR_12="#F4BF75"           # Bright Yellow
export COLOR_13="#6A9FB5"           # Bright Blue (Folder)
export COLOR_14="#AA759F"           # Bright Magenta
export COLOR_15="#75B5AA"           # Bright Cyan
export COLOR_16="#F5F5F5"           # Bright White

export BACKGROUND_COLOR="#151515"   # Background
export FOREGROUND_COLOR="#D0D0D0"   # Foreground (Text)

export CURSOR_COLOR="#D0D0D0" # Cursor

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
