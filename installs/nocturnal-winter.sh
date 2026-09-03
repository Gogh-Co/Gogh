#!/usr/bin/env bash

export PROFILE_NAME="Nocturnal Winter"

export COLOR_01="#4D4D4D"           # Black (Host)
export COLOR_02="#F12D52"           # Red (Syntax string)
export COLOR_03="#09CD7E"           # Green (Command)
export COLOR_04="#F5F17A"           # Yellow (Command second)
export COLOR_05="#3182E0"           # Blue (Path)
export COLOR_06="#FF2B6D"           # Magenta (Syntax var)
export COLOR_07="#09C87A"           # Cyan (Prompt)
export COLOR_08="#FCFCFC"           # White

export COLOR_09="#808080"           # Bright Black
export COLOR_10="#F16D86"           # Bright Red (Command error)
export COLOR_11="#0AE78D"           # Bright Green (Exec)
export COLOR_12="#FFFC67"           # Bright Yellow
export COLOR_13="#6096FF"           # Bright Blue (Folder)
export COLOR_14="#FF78A2"           # Bright Magenta
export COLOR_15="#0AE78D"           # Bright Cyan
export COLOR_16="#FFFFFF"           # Bright White

export BACKGROUND_COLOR="#0D0D17"   # Background
export FOREGROUND_COLOR="#E6E5E5"   # Foreground (Text)

export CURSOR_COLOR="#E6E5E5" # Cursor

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
