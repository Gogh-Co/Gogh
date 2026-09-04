#!/usr/bin/env bash

export PROFILE_NAME="Detroit Become Human"

export COLOR_01="#928C80"           # Black (Host)
export COLOR_02="#DD563E"           # Red (Syntax string)
export COLOR_03="#78E05E"           # Green (Command)
export COLOR_04="#F9FF4C"           # Yellow (Command second)
export COLOR_05="#78D6F2"           # Blue (Path)
export COLOR_06="#565BBC"           # Magenta (Syntax var)
export COLOR_07="#BCE5D2"           # Cyan (Prompt)
export COLOR_08="#FFFFFF"           # White

export COLOR_09="#A0A0A0"           # Bright Black
export COLOR_10="#DF806E"           # Bright Red (Command error)
export COLOR_11="#B9E293"           # Bright Green (Exec)
export COLOR_12="#E2D07A"           # Bright Yellow
export COLOR_13="#6DDDF1"           # Bright Blue (Folder)
export COLOR_14="#6369DB"           # Bright Magenta
export COLOR_15="#90E6BF"           # Bright Cyan
export COLOR_16="#FBFCFF"           # Bright White

export BACKGROUND_COLOR="#1A1A18"   # Background
export FOREGROUND_COLOR="#6AE4F1"   # Foreground (Text)

export CURSOR_COLOR="#6AE4F1" # Cursor

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
