#!/usr/bin/env bash

export PROFILE_NAME="Aizen Dark"

export COLOR_01="#1A1A1A"           # Black (Host)
export COLOR_02="#F08898"           # Red (Syntax string)
export COLOR_03="#A4E09C"           # Green (Command)
export COLOR_04="#F5DEA4"           # Yellow (Command second)
export COLOR_05="#84B4F8"           # Blue (Path)
export COLOR_06="#C8A2F4"           # Magenta (Syntax var)
export COLOR_07="#90DCD0"           # Cyan (Prompt)
export COLOR_08="#D0D6F0"           # White

export COLOR_09="#444444"           # Bright Black
export COLOR_10="#F08898"           # Bright Red (Command error)
export COLOR_11="#A4E09C"           # Bright Green (Exec)
export COLOR_12="#F5DEA4"           # Bright Yellow
export COLOR_13="#84B4F8"           # Bright Blue (Folder)
export COLOR_14="#C8A2F4"           # Bright Magenta
export COLOR_15="#90DCD0"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#1A1A1A"   # Background
export FOREGROUND_COLOR="#D0D6F0"   # Foreground (Text)

export CURSOR_COLOR="#F8B080" # Cursor

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
