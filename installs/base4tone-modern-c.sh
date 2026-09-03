#!/usr/bin/env bash

export PROFILE_NAME="Base4Tone Modern C"

export COLOR_01="#221F1C"           # Black (Host)
export COLOR_02="#5C6FEB"           # Red (Syntax string)
export COLOR_03="#DD407C"           # Green (Command)
export COLOR_04="#F17EAA"           # Yellow (Command second)
export COLOR_05="#E6971A"           # Blue (Path)
export COLOR_06="#1BBBA6"           # Magenta (Syntax var)
export COLOR_07="#E96396"           # Cyan (Prompt)
export COLOR_08="#EEEBE8"           # White

export COLOR_09="#0D0B07"           # Bright Black
export COLOR_10="#929FF7"           # Bright Red (Command error)
export COLOR_11="#F391B6"           # Bright Green (Exec)
export COLOR_12="#F6B1CC"           # Bright Yellow
export COLOR_13="#F5D8A8"           # Bright Blue (Folder)
export COLOR_14="#1ED2BA"           # Bright Magenta
export COLOR_15="#F3CD91"           # Bright Cyan
export COLOR_16="#F9F8F6"           # Bright White

export BACKGROUND_COLOR="#221F1C"   # Background
export FOREGROUND_COLOR="#A39B8F"   # Foreground (Text)

export CURSOR_COLOR="#817479" # Cursor

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
