#!/usr/bin/env bash

export PROFILE_NAME="Synthwave Alpha"

export COLOR_01="#241B30"           # Black (Host)
export COLOR_02="#9A0048"           # Red (Syntax string)
export COLOR_03="#00986C"           # Green (Command)
export COLOR_04="#ADAD3E"           # Yellow (Command second)
export COLOR_05="#6E29AD"           # Blue (Path)
export COLOR_06="#B300AD"           # Magenta (Syntax var)
export COLOR_07="#00B0B1"           # Cyan (Prompt)
export COLOR_08="#B9B1BC"           # White

export COLOR_09="#7F7094"           # Bright Black
export COLOR_10="#E60A70"           # Bright Red (Command error)
export COLOR_11="#0AE4A4"           # Bright Green (Exec)
export COLOR_12="#F9F972"           # Bright Yellow
export COLOR_13="#AA54F9"           # Bright Blue (Folder)
export COLOR_14="#FF00F6"           # Bright Magenta
export COLOR_15="#00FBFD"           # Bright Cyan
export COLOR_16="#F2F2E3"           # Bright White

export BACKGROUND_COLOR="#241B30"   # Background
export FOREGROUND_COLOR="#F2F2E3"   # Foreground (Text)

export CURSOR_COLOR="#F2F2E3" # Cursor

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
